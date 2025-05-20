; EdgeJS Highlight Query
; ---------------------------

; HTML Tags
(element_node
  (tag_name) @tag)

(element_node
  (closing_tag
    (tag_name) @tag))

(self_closing_tag_node
  (tag_name) @tag)

; HTML Attributes
(attribute_node
  (attribute_name) @tag.attribute)

; Strings
(quoted_attribute_value) @string
(string) @string

; Comments
(comment_node) @comment
(comment) @comment

; Edge Directives
(directive_node
  (directive_name) @keyword)

; JavaScript within Edge
(interpolation) @none

(interpolation
  (expression) @expression)

; JS Keywords
["if" "else" "for" "while" "return" "break" "continue" "const" "let" "var"] @keyword

; JS Functions
(function_expression
  "function" @keyword.function
  name: (identifier)? @function)

; JS Variables
(variable_declaration
  name: (identifier) @variable)

(identifier) @variable

; JS Numbers
(number) @number

; Boolean
((identifier) @boolean
 (#match? @boolean "^(true|false)$"))

; Operators
["=" "+" "-" "*" "/" "!" ">" "<" ">=" "<=" "==" "!=" "===" "!==" "&&" "||" "??"] @operator

; Braces and brackets
["(" ")" "[" "]" "{" "}"] @punctuation.bracket

; Separators
[";" "." "," ":"] @punctuation.delimiter

; HTML Entities
(entity_reference) @constant.character.escape
