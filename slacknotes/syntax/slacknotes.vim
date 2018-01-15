
if exists("b:current_syntax")
	finish
endif

syn match dateline   '^[0-9/]\+$' skipwhite
syn match timecarrot '^>'         skipwhite
syn match channel    '^[a-zA-Z0-9_-]\+:$' skipwhite
syn match dash       '^\s*-'      skipwhite
syn match cross      '^\s*x'      skipwhite
syn match dot        '^\s*\.'     skipwhite

let b:current_syntax = 'slacknotes'

hi def link dateline   Type
hi def link timecarrot Type
hi def link channel    Comment
hi def link dash       Type
hi def link cross      Constant
hi def link dot        Statement

setlocal foldmethod=indent
setlocal foldlevel=20

