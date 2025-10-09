; HTML Elements
(tag_name) @constructor

; HTML Attributes
(attribute_name) @property
(attribute_value) @string
(attribute_text) @string

; EdgeJS Directives
(directive) @keyword
(directive_statement) @keyword
(directive_keyword) @keyword.control
(directive_name) @keyword.control
(directive_method) @function

; EdgeJS Expression Content
(function_call) @function.builtin
(member_expression) @property
(identifier) @variable
(ternary_expression) @conditional
(binary_expression) @operator

; EdgeJS Parameters and Literals
(string_literal) @string
(number_literal) @number
(boolean_literal) @constant.builtin
(null_literal) @constant.builtin

; EdgeJS Output Expressions
("{{") @punctuation.bracket
("}}") @punctuation.bracket
("{{{") @punctuation.bracket
("}}}") @punctuation.bracket

; Comments
(comment) @comment

; HTML Structure
("<") @punctuation.bracket
(">") @punctuation.bracket
("</") @punctuation.bracket
("/>") @punctuation.bracket
("<!DOCTYPE") @keyword

; Text content
(text_content) @text

; Mixed content and parameters
(mixed_attribute_value) @string
(complex_parameter) @parameter
(each_parameter) @parameter
(parameter_list) @parameter

; Special elements
(style_element) @tag
(script_element) @tag
(css_content) @string.special
(js_content) @string.special

; Expressions
(output_expression) @embedded
(js_expression) @embedded

; Object expressions
(object_expression) @punctuation.bracket
(object_property) @property
