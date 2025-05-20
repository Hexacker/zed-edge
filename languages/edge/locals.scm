; EdgeJS Local Variables Query
; ---------------------------

; Define variable scopes
[
  (block_statement)
  (function_expression)
  (function_declaration)
  (for_statement)
  (directive_node)
] @local.scope

; Define variable definitions
(variable_declaration
  name: (identifier) @local.definition)

(function_parameter
  (identifier) @local.definition)

; Variable references
(identifier) @local.reference
