////////////////////////////////
// Parser
// -----------------------------

module ts::parser;

fault ParserFault {
  INCOMPATIBLE_LANGUAGE_VERSION,
}

fn Parser*! new_with_language(Language* language) {
  Parser* parser = ts::parser_new();
  return ts::parser_set_language(parser, language) ? parser : ParserFault.INCOMPATIBLE_LANGUAGE_VERSION?;
}

fn void delete(Parser* parser) {
  ts::parser_delete(parser);
}

fn Tree* parse_string(Parser* parser, Tree* old_tree, String string) {
  return ts::parser_parse_string(parser, old_tree, string.ptr, string.len);
}

////////////////////////////////
// Node
// -----------------------------

module ts::node;

fn bool Node.is_null(self) @inline => ts::node_is_null(self);
fn usz Node.start_byte(self) @inline => ts::node_start_byte(self);
fn usz Node.end_byte(self) @inline => ts::node_end_byte(self);
fn String Node.get_text(self, char[] data) @inline => (String)data[self.start_byte() .. self.end_byte()-1];

////////////////////////////////
// Query
// -----------------------------

module ts::query;

fault QueryFault {
  SYNTAX,
  NODE_TYPE,
  FIELD,
  CAPTURE,
  STRUCTURE,
  LANGUAGE,
}

fn QueryFault fault_from_error(QueryError err) @private {
  switch (err) {
    case SYNTAX: return QueryFault.SYNTAX;
    case NODE_TYPE: return QueryFault.NODE_TYPE;
    case FIELD: return QueryFault.FIELD;
    case CAPTURE: return QueryFault.CAPTURE;
    case STRUCTURE: return QueryFault.STRUCTURE;
    case LANGUAGE: return QueryFault.LANGUAGE;
    default: unreachable();
  }
}

<*
 Create a new query.
 @param language "Tree-sitter language to use."
 @param [in] query "The query string containing one or more S-expression patterns."
 @param [out] error_offset "Offset of error in query."
*>
fn Query*! new(Language* language, String query, uint* error_offset = null) {
  QueryError error_type;
  Query* result = ts::query_new(language, query.ptr, query.len, error_offset, &error_type);
  if (!result) {
    return fault_from_error(error_type)?;
  }
  return result;
}

<*
 Delete a query, freeing all of the memory that it used.
*>
fn void delete(Query* query) {
  ts::query_delete(query);
}

// Query Match
// -----------------------------

<*
 Try to get a QueryCapture from a QueryMatch by name.
*>
fn QueryCapture! QueryMatch.get_capture(&match, String name, Query* query) {
  for (uint i = 0; i < match.capture_count; i++) {
    QueryCapture capture = match.captures[i];

    String capture_name = {|
      uint length;
      ZString str = ts::query_capture_name_for_id(query, capture.index, &length);
      return (String)str[:length];
    |};

    if (name == capture_name) {
      return capture;
    }
  }

  return SearchResult.MISSING?;
}

// Query Capture
// -----------------------------

fn usz QueryCapture.start_byte(&self) @inline => self.node.start_byte();
fn usz QueryCapture.end_byte(&self) @inline => self.node.end_byte();
fn String QueryCapture.get_text(&self, char[] data) @inline => self.node.get_text(data);

////////////////////////////////
// Query Cursor
// -----------------------------

module ts::query_cursor;

fn QueryCursor* new() => ts::query_cursor_new();
fn void delete(QueryCursor* cursor) => ts::query_cursor_delete(cursor);

macro void @exec(QueryCursor* cursor, Query* query, Node node; @body(QueryMatch* match)) {
  ts::query_cursor_exec(cursor, query, node);
  for (QueryMatch match; ts::query_cursor_next_match(cursor, &match);) {
    @body(&match);
  }
}
