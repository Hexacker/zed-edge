; Indent after opening HTML tags
(start_tag) @indent

; Indent after EdgeJS block directive statements
(directive_statement) @indent

; Outdent before closing HTML tags
(end_tag) @outdent

; Outdent before EdgeJS directive keywords
(directive_keyword) @outdent
