; Define indentation rules
(element
  (start_tag)
  (_)* @indent
  (end_tag))

(directive_block
  "@" (identifier)
  (_)* @indent
  "@end" (identifier))
