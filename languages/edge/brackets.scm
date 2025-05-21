; Edge Template Bracket Matching

; HTML tag pairs
(open_tag) @open
(close_tag) @close

; Edge directive pairs
(if_directive) @open
"@end" @close

(each_directive) @open
"@end" @close

(component_directive) @open
"@end" @close

(slot_directive) @open
"@end" @close

; Output expression delimiters
"{{" @open
"}}" @close

; Standard brackets
["(" ")"] @bracket.paren
