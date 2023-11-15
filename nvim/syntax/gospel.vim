" Vim syntax file
" Language:     Gospel annotations in OCaml programs
" Maintainers:  Paul Patault (paul.patault@universite-paris-saclay.fr)
"-------------------------------------------------------------------------------

syn match GospelStart /@/

syn region GospelCommentInComment start="(\*" end="\*)" containedin=GospelComment contained

"-------------------------------------------------------------------------------

syn keyword GospelKeyword axiom
syn keyword GospelKeyword checks coercion consumes
syn keyword GospelKeyword diverges
syn keyword GospelKeyword ensures ephemeral equivalent exists
syn keyword GospelKeyword forall function
syn keyword GospelKeyword invariant
syn keyword GospelKeyword match model modifies mutable
syn keyword GospelKeyword open
syn keyword GospelKeyword predicate pure
syn keyword GospelKeyword raises rec requires
syn keyword GospelKeyword type
syn keyword GospelKeyword val variant variant
syn keyword GospelKeyword with

syn match   GospelSymbol   /<->/
syn match   GospelSymbol   /->/
syn match   GospelSymbol   /<-/
syn match   GospelSymbol   /\\\//
syn match   GospelSymbol   /\/\\/

"-------------------------------------------------------------------------------

hi def link GospelComment          Comment
hi def link GospelCommentInComment Comment
hi def link GospelKeyword          Identifier
hi def link GospelStart            Comment
hi def link GospelSymbol           Comment

"-------------------------------------------------------------------------------
