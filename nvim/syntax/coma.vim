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
syn region comaEncl transparent matchgroup=comaDelimiter start="("  end=")"  contains=ALLBUT,comaParenErr
syn region comaEncl transparent matchgroup=comaDelimiter start="{"  end="}"  contains=ALLBUT,comaBraceErr
syn region comaEncl transparent                          start="\[" end="\]" contains=ALLBUT,comaBrackErr
" syn region comaPrewrites start="\[" end="\]"


" Keywords
syn keyword comaConstant    true false
" syn match   comaType        "\((\_s*\(\w\_s*\)\+:\_s*\)\@<=\((\<[a-zA-Z\'][a-zA-Z0-9_\.\' ]*\>)\)\_s*)\@="
" syn match   comaType        "\((\_s*\(\w\_s*\)\+:\_s*\)\@<=\(\<[a-zA-Z\'][a-zA-Z0-9_\.\' ]*\>\)\_s*)\@="
" syn match   comaType        "\({\_s*\(\w\_s*\)\+:\_s*\)\@<=\((\?\<[a-zA-Z\'][a-zA-Z0-9_\.\' ]*\>)\?\)\_s*}\@="
" syn match   comaType        "\(\(forall\)\|\(exists\)\_s\+\(\w\+\)\+\_s*:\_s*\)\@<=\(\<[a-zA-Z\'][a-zA-Z0-9_\.()\' ]*\>\)\_s*\.\@="
syn match   comaConstant    "\<[A-Z][a-zA-Z0-9_\.]*\>"
" syn match   comaConstant    "\(:\_s*\)\@<!\(\<[A-Z][a-zA-Z0-9_\.]*\>\)"
syn keyword comaOperator    and or not xor
syn keyword comaKeyword     as axiom by coercion constant end exists
syn keyword comaKeyword     forall fun function goal inductive invariant
syn keyword comaKeyword     lemma let match meta module predicate rec type
syn keyword comaKeyword     variant with
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
syn match comaOperator    "<->" conceal cchar=↔
syn match comaOperator    "->"  conceal cchar=→
syn match comaOperator    "<-"  conceal cchar=←
syn match comaOperator    "-"

" todos
syn keyword comaTodo     contained TODO FIXME
syn region  comaComment  start="(\*" end="\*)" contains=comaComment,comaTodo
syn match   comaComment  "--.*" contains=comaTodo

syn region  comaString   start="\""  end="\""
syn region  comaExpl     start="\(\[@\|\[#\)" end="\]"  contains=comaComment,comaTodo

" Imports
syn region  comaNone   matchgroup=comaKeyword start="\<\(use\|clone\)\>" matchgroup=comaModSpec end="\<\(\w\+\.\)*\u\(\w\|'\)*\>" contains=@comaAllErrs,comaComment,comaImport,comaExport
syn keyword comaExport contained export
syn keyword comaImport contained import

syn sync lines=250
hi link comaDelimiter      Comment
hi link comaComment        Comment
hi link comaParam          Ignore
hi link comaConstant       Number
hi link comaString         String
hi link comaIdentifier     Ignore
hi link comaPrimitive      Identifier
hi link comaNumber         Number
hi link comaOperator       Keyword
hi link comaKeyword        Keyword
hi link comaExport         Keyword
hi link comaImport         Keyword
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
hi link comaExpl           Comment
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
