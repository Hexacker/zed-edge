; Edge Template Indentation

; Indent within HTML elements
(element) @indent

; Indent within directives
(if_directive) @indent
(else_directive) @indent
(each_directive) @indent
(component_directive) @indent
(slot_directive) @indent

; End indentation
"@end" @outdent
