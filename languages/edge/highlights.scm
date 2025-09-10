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
(unary_expression) @operator
(array_literal) @punctuation.bracket

; EdgeJS Parameters
(each_parameter) @variable
(component_parameter) @variable
(let_parameter) @variable
(param_identifier) @variable
(param_string) @string
(param_number) @number
(param_boolean) @constant
(param_object) @punctuation.bracket
(param_property) @property
(param_member_expression) @property

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
"<!DOCTYPE" @keyword

; Directive symbols
"@" @operator
"?" @conditional
":" @operator

; Operators
"||" @operator
"&&" @operator
"==" @operator
"!=" @operator
"===" @operator
"!==" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator

; Text content
(text_content) @text
(raw_text) @text

; Standalone expressions
(standalone_expression) @conditional