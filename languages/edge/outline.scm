; EdgeJS Outline Query
; ---------------------------

; HTML Elements with IDs
(element_node
  (tag_name) @name
  (attribute_node
    (attribute_name) @_attr_name
    (quoted_attribute_value 
      (attribute_value) @_attr_value)
    (#eq? @_attr_name "id"))
  (#set! role "element")
  (#set! label "\(@name)#\(@_attr_value)"))

; HTML Elements (without IDs)
(element_node
  (tag_name) @name
  (#set! role "element"))

; Edge Directives
(directive_node
  (directive_name) @name
  (#set! role "directive"))

; JS Functions
(function_expression
  "function" 
  name: (identifier)? @name
  (#set! role "function"))

; Component invocations
(element_node
  (tag_name) @_tag
  (#match? @_tag "^[A-Z]")
  (#set! role "component")
  (#set! label @_tag))
