
if exists("b:current_syntax")
	finish
endif


" Matching tokens/whatnot

syn match tab0     '^\. [^:]*:\?.*$'  contains=name,postname nextgroup=postname skipwhite
syn match tab0next '^  \S.*$'   skipwhite
syn match tab1     '^\t\.'      skipwhite
syn match tab2     '^\t\t\.'    skipwhite
syn match tab3     '^\t\t\t\.'  skipwhite

syn match tab5     '^\t\t\t\t\t\.'       skipwhite
syn match tab6     '^\t\t\t\t\t\t\.'     skipwhite
syn match tab7     '^\t\t\t\t\t\t\t\.'   skipwhite
syn match tab8     '^\t\t\t\t\t\t\t\t\.' skipwhite

syn match name '\w+:' contained skipwhite
syn match postname ':.*$' contained skipwhite



" Highlighting specified here...

let b:current_syntax = 'storyline'

hi def link name     Constant
hi def link postname Statement
hi def link tab0     Type
hi def link tab0next Type

hi def link tab1  Constant
hi def link tab2  Statement
hi def link tab3  Comment

hi def link tab5  Type
hi def link tab6  Constant
hi def link tab7  Statement
hi def link tab8  Comment


setlocal foldmethod=indent
setlocal foldlevel=20

