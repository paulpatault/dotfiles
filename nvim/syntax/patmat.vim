" Vim syntax file
" Language: patmat
" Author: Paul Patault

if exists("b:current_syntax")
  finish
endif

syn clear

syn case ignore

syn keyword patmatStatement  match with of when type let fun and

syn match   patmatDelimiter  "[()]"
syn region  patmatComment    start="/\*"  end="\*/"
syn region  patmatComment    start="(\*"  end="\*)"
syn keyword patmatType       int string
syn match   patmatOperator   "->" "|" "="
syn region  patmatConstant   start='"'   end='"'


syn sync lines=250

hi link patmatStatement      Statement
hi link patmatConditional    Conditional
hi link patmatConstant       Number
hi link patmatOperator       Operator
hi link patmatFunction       Function
hi link patmatType           Type
hi link patmatComment        Comment
hi link patmatDelimiter      Identifier

let b:current_syntax = "patmat"

" vim: ts=8
