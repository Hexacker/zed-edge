; Show HTML elements in outline
(start_tag
  (tag_name) @name) @item

; Show EdgeJS directive statements in outline
(directive_statement
  (directive_name) @name) @item

; Show EdgeJS directive keywords for navigation
(directive_keyword) @item

; Show comments in outline for easy navigation
(comment) @item
