
syn include @GOSPEL syntax/gospel.vim
syn region GospelComment matchgroup=GospelComment start="(\*@"rs=e-1 end="\*)" contains=@GOSPEL


"""""""""""""""""""""""""""""""""""""""""""""""""""
" due to new ocaml syntax file

syn region ocamlTypeDef
\ matchgroup=ocamlKeyword start="\<type\>\(\_s\+\<nonrec\>\)\?\|\<constraint\>\|\<exception\>"
\ matchgroup=NONE end="\(\<type\>\|\<exception\>\|\<val\>\|\<module\>\|\<class\>\|\<method\>\|\<constraint\>\|\<inherit\>\|\<object\>\|\<struct\>\|\<open\>\|\<include\>\|\<let\>\|\<external\>\|\<in\>\|\<end\>\|)\|]\|}\|;\|;;\)\@="
\ contains=@ocamlTypeExpr,ocamlTypeEq,ocamlTypePrivate,ocamlTypeDefDots,ocamlTypeRecordDecl,ocamlTypeSumDecl,ocamlTypeDefAnd,ocamlComment,ocamlPpx,GospelComment

syn region ocamlTypeAnnot matchgroup=ocamlKeyChar start=":\(>\|\_s*type\>\|[>:=]\@!\)"
\ matchgroup=NONE end="\(\<type\>\|\<exception\>\|\<val\>\|\<module\>\|\<class\>\|\<method\>\|\<constraint\>\|\<inherit\>\|\<object\>\|\<struct\>\|\<open\>\|\<include\>\|\<let\>\|\<external\>\|\<in\>\|\<end\>\|)\|]\|}\|;\|;;\)\@="
\ matchgroup=NONE end="\(;\|}\)\@="
\ matchgroup=NONE end="\(=\|:>\)\@="
\ contains=@ocamlTypeExpr,ocamlComment,ocamlPpx,GospelComment
"
"""""""""""""""""""""""""""""""""""""""""""""""""""
