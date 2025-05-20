; Edge template syntax highlighting
(comment) @comment

; Edge directives
(directive
  "@" @punctuation.special
  name: (identifier) @keyword)

; Edge expressions
(expression
  "{{" @punctuation.special
  content: (_) @variable
  "}}" @punctuation.special)

; HTML elements (assuming Edge extends HTML)
(element
  (start_tag
    name: (tag_name) @tag)
  (end_tag
    name: (tag_name) @tag))

(attribute_name) @property
(attribute_value) @string
