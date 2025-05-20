; EdgeJS Injection Query
; ---------------------------

; JavaScript within Edge templates
(interpolation) @injection.content
(#set! injection.language "javascript")

; Edge directives
(directive_node
  (expression) @injection.content)
(#set! injection.language "javascript")

; Embedded JavaScript in attributes
(attribute_node
  (attribute_name) @_attr
  (#match? @_attr "^on")
  (quoted_attribute_value) @injection.content
  (#set! injection.language "javascript"))

; CSS in style tags
((element_node
  (tag_name) @_tag
  (#eq? @_tag "style")
  (text) @injection.content)
 (#set! injection.language "css"))

; JavaScript in script tags
((element_node
  (tag_name) @_tag
  (#eq? @_tag "script")
  (text) @injection.content)
 (#set! injection.language "javascript"))
