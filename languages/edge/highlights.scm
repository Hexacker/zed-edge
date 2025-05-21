; Edge Template Syntax Highlighting

; HTML Tags
(tag_name) @tag

; Attributes
(attribute_name) @tag.attribute
(attribute_value) @string
(quoted_attribute_value) @string

; Edge Directives
(if_directive "@if") @keyword.control
(else_directive "@else") @keyword.control
(else_directive "@elseif") @keyword.control
(each_directive "@each") @keyword.control
(component_directive "@component") @keyword.control
(slot_directive "@slot") @keyword.control
(include_directive "@include") @keyword.function
(let_directive "@let") @keyword
(raw_directive "@" @operator (identifier) @function)

; Output expressions
(output_expression "{{" @punctuation.bracket
                    "}}" @punctuation.bracket)

; JavaScript expressions
(js_expression) @expression

; Comments
(comment) @comment

; Identifiers
(identifier) @variable
