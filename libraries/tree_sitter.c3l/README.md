# tree_sitter.c3l

## Usage Example

This is an example for how use tree-sitter together with the [tree-sitter-c3](https://github.com/c3lang/tree-sitter-c3) grammar.

Add to your project settings:
```json
  "dependencies": [ "tree_sitter", "tree_sitter_c3" ],
```

```c
import ts;
import tree_sitter_c3; // tree-sitter-c3 bindings

fn void! main(String[] args) {
  Language* language = tree_sitter_c3::language();
  Parser* parser = parser::new_with_language(language)!;
  defer parser::delete(parser);

  String patterns = `(bitstruct_body (bitstruct_member_declaration ":" @delimiter)+ @member)`;
  
  Query* query = query::new(language, patterns)!;
  defer query::delete(query);
  
  QueryCursor* cursor = ts::query_cursor_new();
  defer ts::query_cursor_delete(cursor);

  ts::query_cursor_exec(cursor, query, root_node);

  for (QueryMatch match; ts::query_cursor_next_match(cursor, &match);) {
    QueryCapture! member_capture = match.get_capture("member", query);
    QueryCapture! delimiter_capture = match.get_capture("delimiter", query);
    // ...
  }
}
```

