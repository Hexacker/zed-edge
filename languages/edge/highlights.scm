; HTML Elements
(tag_name) @constructor

; HTML Attributes
(attribute_name) @attribute
(attribute_value) @string
(attribute_text) @string

; EdgeJS Directives
(directive_name) @keyword.control
(directive_method) @function
"end" @keyword.control
"else" @keyword.control  
"elseif" @keyword.control

; EdgeJS Expression Content
(function_call) @function.builtin
(member_expression) @property
(identifier) @variable
(ternary_expression) @conditional
(binary_expression) @operator

; EdgeJS Parameters
(complex_parameter) @variable

; EdgeJS Output Expressions
"{{" @punctuation.bracket
"}}" @punctuation.bracket
"{{{" @punctuation.bracket
"}}}" @punctuation.bracket

; Comments
(comment) @comment

; HTML Structure
"<" @punctuation.bracket
">" @punctuation.bracket
"</" @punctuation.bracket
"/>" @punctuation.bracket

; Directive symbols
"@" @operator
"||" @operator
"&&" @operator
"?" @conditional

; Text content
(text_content) @text

; DOCTYPE
"<!DOCTYPE" @keyword
"html" @constructor

; Standalone expressions
(standalone_expression) @conditional
