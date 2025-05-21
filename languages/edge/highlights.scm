; EdgeJS Syntax Highlighting - Comment Focus

; HTML elements
(tag_name) @tag
(attribute_name) @tag.attribute
(attribute_value) @string
(quoted_attribute_value) @string

; Edge directives
(if_directive) @keyword.control
(else_directive) @keyword.control
(each_directive) @keyword.control
(component_directive) @keyword
(slot_directive) @keyword
(include_directive) @keyword
(let_directive) @keyword

; Raw directive components
"@" @keyword.directive
(directive_expression) @function.directive

; Each directive special syntax
(each_params "in") @keyword

; Output expressions
"{{" @punctuation.special
"}}" @punctuation.special
"{{{" @punctuation.special
"}}}" @punctuation.special

; Expression components
(identifier) @variable
(string) @string
(number) @number
(method_call) @function.call
(member_expression) @property

; Comments with different styling
(comment) @comment.dim
