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

; EdgeJS Parameters
(param_string) @string

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

; Operators
("||") @operator
("&&") @operator
("?") @conditional
(":") @operator

; Text content
(text_content) @text

; Standalone expressions
(standalone_expression) @conditional

; Mixed content
(mixed_attribute_value) @string
(complex_parameter) @string
(style_element) @tag
(script_element) @tag
(css_content) @string.special
(js_content) @string.special
(directive_component) @function
(directive_params) @parameter
(parameter_list) @parameter
(output_expression) @embedded
(expression_content) @embedded