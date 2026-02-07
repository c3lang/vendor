////////////////////////////////
// Parser
// -----------------------------

module ts::parser;

faultdef INCOMPATIBLE_LANGUAGE_VERSION;

fn TSParser*? new_with_language(TSLanguage* language) {
  TSParser* parser = ts::parser_new();
  return ts::parser_set_language(parser, language) ? parser : INCOMPATIBLE_LANGUAGE_VERSION~;
}

fn void delete(TSParser* parser) {
  ts::parser_delete(parser);
}

fn TSTree* parse_string(TSParser* parser, TSTree* old_tree, String string) {
  return ts::parser_parse_string(parser, old_tree, string.ptr, string.len);
}

////////////////////////////////
// Node
// -----------------------------

module ts::node;

fn bool TSNode.is_null(self) @inline => ts::node_is_null(self);
fn usz TSNode.start_byte(self) @inline => ts::node_start_byte(self);
fn usz TSNode.end_byte(self) @inline => ts::node_end_byte(self);
fn TSPoint TSNode.start_point(self) @inline => ts::node_start_point(self);
fn TSPoint TSNode.end_point(self) @inline => ts::node_end_point(self);
fn String TSNode.type(self) @inline => ts::node_type(self).str_view();
fn String TSNode.get_text(self, char[] data) @inline => (String)data[self.start_byte() .. self.end_byte()-1];

////////////////////////////////
// Query
// -----------------------------

module ts::query;

faultdef SYNTAX, NODE_TYPE, FIELD, CAPTURE, STRUCTURE, LANGUAGE;

fn fault fault_from_error(TSQueryError err) @private {
  switch (err) {
    case SYNTAX: return SYNTAX;
    case NODE_TYPE: return NODE_TYPE;
    case FIELD: return FIELD;
    case CAPTURE: return CAPTURE;
    case STRUCTURE: return STRUCTURE;
    case LANGUAGE: return LANGUAGE;
    default: unreachable();
  }
}

<*
 Create a new query.
 @param language : "Tree-sitter language to use."
 @param [in] query : "The query string containing one or more S-expression patterns."
 @param [out] error_offset : "Offset of error in query."
*>
fn TSQuery*? new(TSLanguage* language, String query, uint* error_offset = null) {
  TSQueryError error_type;
  TSQuery* result = ts::query_new(language, query.ptr, query.len, error_offset, &error_type);
  if (!result) {
    return fault_from_error(error_type)~;
  }
  return result;
}

<*
 Delete a query, freeing all of the memory that it used.
*>
fn void delete(TSQuery* query) {
  ts::query_delete(query);
}

// Query Match
// -----------------------------

<*
 Try to get a TSQueryCapture from a TSQueryMatch by name.
*>
fn TSQueryCapture? TSQueryMatch.get_capture(&match, String name, TSQuery* query) {
  for (uint i = 0; i < match.capture_count; i++) {
    TSQueryCapture capture = match.captures[i];

    uint length;
    ZString str = ts::query_capture_name_for_id(query, capture.index, &length);
    String capture_name = (String)str[:length];

    if (name == capture_name) {
      return capture;
    }
  }

  return NOT_FOUND~;
}

// Query Capture
// -----------------------------

fn usz TSQueryCapture.start_byte(&self) @inline => self.node.start_byte();
fn usz TSQueryCapture.end_byte(&self) @inline => self.node.end_byte();
fn String TSQueryCapture.get_text(&self, char[] data) @inline => self.node.get_text(data);

////////////////////////////////
// Query Cursor
// -----------------------------

module ts::query_cursor;

fn TSQueryCursor* new() => ts::query_cursor_new();
fn void delete(TSQueryCursor* cursor) => ts::query_cursor_delete(cursor);

macro void @exec(TSQueryCursor* cursor, TSQuery* query, TSNode node; @body(TSQueryMatch* match)) {
  ts::query_cursor_exec(cursor, query, node);
  for (TSQueryMatch match; ts::query_cursor_next_match(cursor, &match);) {
    @body(&match);
  }
}
