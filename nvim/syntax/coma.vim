" Vim syntax file
" Language:  Coma
" Filenames: *.coma
" Author:    Paul Patault
" Contact:   paul.patault@ens-paris-saclay.fr

if exists("b:current_syntax")
  finish
endif

syn clear
syn case match

syn match comaIdentifier  "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

" Errors
syn match   comaBraceErr   "}"
syn match   comaBrackErr   "\]"
syn match   comaParenErr   ")"
syn match   comaCommentErr "\*)"
syn cluster comaAllErrs contains=comaBraceErr,comaBrackErr,comaParenErr,comaCommentErr

" Enclosing delimiters
syn region comaEncl transparent matchgroup=comaDelimiter start="(" matchgroup=comaDelimiter end=")" contains=ALLBUT,comaParenErr
syn region comaEncl transparent matchgroup=comaDelimiter start="{" matchgroup=comaDelimiter end="}" contains=ALLBUT,comaBraceErr
syn region comaEncl transparent start="\[" end="\]" contains=ALLBUT,@comaContained,comaBrackErr
" syn region comaPrewrites start="\[" end="\]"

" Keywords
syn keyword comaConstant    true false
syn keyword comaOperator    and or not xor
syn keyword comaKeyword     fun let as by with rec
syn keyword comaType        bool int list
syn keyword comaPrimitive   any
syn keyword comaValue       cons nil rev sorted

syn match comaBoxes "!" conceal cchar=↑
syn match comaBoxes "?" conceal cchar=↓

syn match  comaType       "'\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn region comaTypes      start="<" end=">" contains=comaType

" 
syn match comaNumber      "\<[0-9]\+\>"
syn match comaOperator    "[&+*=><^]"
syn match comaOperator    ">="
syn match comaOperator    "<="
syn match comaOperator    "<>"
syn match comaOperator    "->" conceal cchar=→
syn match comaOperator    "<-" conceal cchar=←

" todos
syn keyword comaTodo contained TODO FIXME
syn region  comaComment  start="(\*" end="\*)" contains=comaComment,comaTodo
syn match   comaComment  "--.*" contains=comaTodo

" Imports
syn region  comaNone   matchgroup=comaKeyword start="\<\(use\|clone\)\>" matchgroup=comaModSpec end="\<\(\w\+\.\)*\u\(\w\|'\)*\>" contains=@comaAllErrs,comaComment,comaImport,comaExport
syn keyword comaExport contained export
syn keyword comaImport contained import

syn sync lines=250
hi link comaDelimiter      Comment
hi link comaComment        Comment
hi link comaParam          Ignore
hi link comaConstant       Number
hi link comaIdentifier     Ignore
hi link comaPrimitive      Ignore
hi link comaNumber         Number
hi link comaOperator       Keyword
hi link comaKeyword        Keyword
hi link comaTodo           Todo
hi link comaType           Type
hi link comaTypes          StorageClass
hi link comaPrewrites      Special
hi link comaDefinition     Ignore
hi link comaBoxes          Keyword
hi link comaModSpec        Include
hi link comaBraceErr       Error
hi link comaBrackErr       Error
hi link comaParenErr       Error
hi link comaCommentErr     Error
hi! link Conceal           Keyword
" set conceallevel=2

function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    else
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>

let b:current_syntax = "coma"

" vim: ts=8
