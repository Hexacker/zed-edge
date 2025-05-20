; EdgeJS Bracket Query
; ---------------------------

; HTML tag pairs
(element_node
  (tag_name) @open
  (closing_tag
    (tag_name) @close)
  (#eq? @open @close))

; JS brackets
(["(" ")" "[" "]" "{" "}"] @bracket)

; Bracket pairs
["(" ")"] @bracket.paren
["{" "}"] @bracket.curly
["[" "]"] @bracket.square

; Matching directive blocks
(directive_node
  (directive_name) @directive.open)
(end_directive_node
  (end_directive_name) @directive.close
  (#eq? @directive.open @directive.close))
