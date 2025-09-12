; Inject JavaScript for EdgeJS output expressions
((output_expression) @injection.content
 (#set! injection.language "javascript")
 (#set! injection.include-children))

; Inject JavaScript for directive parameters
((directive_params) @injection.content
 (#set! injection.language "javascript"))

; Inject CSS for style elements
((style_element (css_content) @injection.content)
 (#set! injection.language "css"))

; Inject JavaScript for script elements
((script_element (js_content) @injection.content)
 (#set! injection.language "javascript"))