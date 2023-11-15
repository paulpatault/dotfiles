
" Vim syntax file
" Language:  while
" Filenames: *.while
" Author:    Paul Patault
" Contact:   paul.patault@ens-paris-saclay.fr

if exists("b:current_syntax")
  finish
endif

syn clear
syn case match

syn match whileIdentifier  "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

" Errors
syn match   whileBraceErr   "}"
syn match   whileBrackErr   "\]"
syn match   whileParenErr   ")"
syn match   whileCommentErr "\*)"
syn cluster whileAllErrs contains=whileBraceErr,whileBrackErr,whileParenErr,whileCommentErr

" Enclosing delimiters
syn region whileEncl transparent matchgroup=whileDelimiter start="(" matchgroup=whileDelimiter end=")" contains=ALLBUT,whileParenErr
syn region whileEncl transparent matchgroup=whileDelimiter start="{" matchgroup=whileDelimiter end="}" contains=ALLBUT,whileBraceErr
syn region whileEncl transparent start="\[" end="\]" contains=ALLBUT,@whileContained,whileBrackErr
" syn region whilePrewrites start="\[" end="\]"

" Keywords
syn keyword whileConstant    true false
syn keyword whileOperator    and or not xor
syn keyword whileType        bool int list
syn keyword whileKeyword     assert if then else end let while do done invariant
" syn keyword whileValue       cons nil rev sorted

"
syn match whileNumber      "\<[0-9]\+\>"
syn match whileOperator    "[&+*=><^]"
syn match whileOperator    ">="
syn match whileOperator    "<="
syn match whileOperator    "<>"

" todos
syn keyword whileTodo contained TODO FIXME
syn region  whileComment  start="(\*" end="\*)" contains=whileComment,whileTodo

" Imports
syn region  whileNone   matchgroup=whileKeyword start="\<\(use\|clone\)\>" matchgroup=whileModSpec end="\<\(\w\+\.\)*\u\(\w\|'\)*\>" contains=@whileAllErrs,whileComment,whileImport,whileExport
syn keyword whileExport contained export
syn keyword whileImport contained import

syn sync lines=250
hi link whileDelimiter      Comment
hi link whileComment        Comment
hi link whileParam          Ignore
hi link whileConstant       Number
hi link whileIdentifier     Ignore
hi link whilePrimitive      Ignore
hi link whileNumber         Number
hi link whileOperator       Keyword
hi link whileKeyword        Keyword
hi link whileTodo           Todo
hi link whileType           Type
hi link whileTypes          StorageClass
hi link whilePrewrites      Special
hi link whileDefinition     Ignore
hi link whileBoxes          Keyword
hi link whileModSpec        Include
hi link whileBraceErr       Error
hi link whileBrackErr       Error
hi link whileParenErr       Error
hi link whileCommentErr     Error
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

let b:current_syntax = "while"

" vim: ts=8
