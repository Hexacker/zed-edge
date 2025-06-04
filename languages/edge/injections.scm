; Inject JavaScript for EdgeJS output expressions
((output_expression) @injection.content
 (#set! injection.language "javascript")
 (#set! injection.include-children))

; Inject JavaScript for directive parameters
((directive_params) @injection.content
 (#set! injection.language "javascript"))
