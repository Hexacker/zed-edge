; EdgeJS Indentation Query
; ---------------------------

; Indent on opening tags/blocks
[
  (element_node)
  (self_closing_tag_node)
  (directive_node)
  (block_statement)
  (if_statement)
  (for_statement)
  (while_statement)
  (function_declaration)
  (function_expression)
  (object)
  (array)
] @indent

; Stop indentation at closing tags/blocks
[
  (closing_tag)
  "}"
  "]"
  ")"
] @outdent

; Dedent on else blocks
[
  "else"
] @outdent @indent

; Indent content inside tags
(element_node
  (text) @indent)
