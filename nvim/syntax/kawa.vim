" Vim syntax file
" Language: Kawa
" Author: Paul Patault

if exists("b:current_syntax")
  finish
endif

syn clear

syn case ignore

syn keyword kawaKeyword         class method var attribute new extends assert
syn keyword kawaConditional     if else while
syn keyword kawaType            int bool void

syn keyword kawaTodo contained  TODO

syn match  kawaIdentifier    "\<[a-zA-Z_][a-zA-Z0-9_]*\>"

syn match  kawaDelimiter     "[({})]"

syn match kawaNumber    "\<[0-9]\+\>"
syn match kawaFloat     "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\>"
syn match kawaFloat     "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\>"
syn match kawaFloat     "\<[0-9]\+e[-+]\=[0-9]\+\>"

syn match kawaOperator "[#+-/*=><^]"
syn match kawaOperator ">="
syn match kawaOperator ">="
syn match kawaOperator "!="

syn region kawaComment    start="/\*" end="\*/" contains=impTodo
syn region kawaComment    start="//"  end="\n"  contains=impTodo
syn region kawaConstant   start="'"   end="'"
syn region kawaConstant   start='"'   end='"'
syn region kawaAnnotation start="@"   end="\n"

syn keyword kawaConstant true false
syn keyword kawaFunction return putchar main putascii printf

syn sync lines=250

hi link kawaStatement      Statement
hi link kawaConditional    Conditional
hi link kawaTodo           Todo
hi link kawaConstant       Number
hi link kawaNumber         Number
hi link kawaFloat          Number
hi link kawaOperator       Operator
hi link kawaFunction       Function
hi link kawaKeyword        Keyword
hi link kawaType           Type
hi link kawaComment        Comment
hi link kawaPack           Type
hi link kawaDelimiter      Identifier
hi link kawaAnnotation     PreProc


let b:current_syntax = "kawa"

" vim: ts=8
