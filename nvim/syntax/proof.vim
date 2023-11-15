if exists("b:current_syntax")
  finish
endif

syn clear

" Les mots-cles
syn keyword proofTerm         Bool true false Type fun Pi Ind J Nat Z S
syn keyword proofCommand      assume context define check eval exit type read check_val

syn sync lines=250

hi link proofTerm         Type
hi link proofCommand      Statement

let b:current_syntax = "proof"

" vim: ts=8
