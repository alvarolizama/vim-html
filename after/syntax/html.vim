" Template syntax for jinja, django, handlebars inside of a html.
" Bassed in https://github.com/mitsuhiko/vim-jinja

syn keyword tplStatement containedin=tplVarBlock,tplTagBlock,tplNested contained and if else in not or for

syn match tplVariable containedin=tplVarBlock,tplTagBlock,tplNested contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn keyword tplSpecial containedin=tplVarBlock,tplTagBlock,tplNested contained false true none

syn match tplOperator "|" containedin=tplVarBlock,tplTagBlock,tplNested contained nextgroup=tplFilter

syn region tplString containedin=tplVarBlock,tplTagBlock,tplNested contained start=/"/ skip=/\\"/ end=/"/
syn region tplString containedin=tplVarBlock,tplTagBlock,tplNested contained start=/'/ skip=/\\'/ end=/'/
syn match tplNumber containedin=tplVarBlock,tplTagBlock,tplNested contained /[0-9]\+\(\.[0-9]\+\)\?/

syn match tplOperator containedin=tplVarBlock,tplTagBlock,tplNested contained /[+\-*\/<>=!,:~%]/
syn match tplPunctuation containedin=tplVarBlock,tplTagBlock,tplNested contained /[()\[\]]/
syn match tplOperator containedin=tplVarBlock,tplTagBlock,tplNested contained /\./ nextgroup=tplAttribute
syn match tplAttribute contained /[a-zA-Z_][a-zA-Z0-9_]*/

syn region tplNested matchgroup=tplOperator start="(" end=")" transparent display containedin=tplVarBlock,tplTagBlock,tplNested contained
syn region tplNested matchgroup=tplOperator start="\[" end="\]" transparent display containedin=tplVarBlock,tplTagBlock,tplNested contained
syn region tplNested matchgroup=tplOperator start="{" end="}" transparent display containedin=tplVarBlock,tplTagBlock,tplNested contained
syn region tplTagBlock matchgroup=tplTagDelim start=/{%-\?/ end=/-\?%}/ skipwhite containedin=ALLBUT,tplTagBlock,tplVarBlock,tplRaw,tplString,tplNested,tplComment
syn region tplVarBlock matchgroup=tplVarDelim start=/{{-\?/ end=/-\?}}/ containedin=ALLBUT,tplTagBlock,tplVarBlock,tplRaw,tplString,tplNested,tplComment
syn match tplStatement containedin=tplTagBlock contained skipwhite /\(^\s*%\s*\|{%-\?\s*\)\@<=\<[a-zA-Z_][a-zA-Z0-9_]*\>\(\s*[,=]\)\@!/


hi def link tplPunctuation tplOperator
hi def link tplAttribute tplVariable

hi def link tplTagDelim tplTagBlock
hi def link tplVarDelim tplVarBlock

hi def link tplSpecial Special
hi def link tplOperator Normal
hi def link tplTagBlock PreProc
hi def link tplVarBlock PreProc
hi def link tplStatement Statement
hi def link tplVariable Identifier
hi def link tplString Constant
hi def link tplNumber Constant

