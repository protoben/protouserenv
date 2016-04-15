" Vim syntax file
" Language: Cryptol
" Maintainer: Ben Hamlin <protob3n@gmail.com>
" Last Change: March 3, 2016
" URL: 
" Use :syn w/in a buffer to see language element breakdown
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" --- Type Signature ---
syn region  cryTypeSig  start=':' end='\$' contains=typeSeqSig,typeModSig
syn match   crySeqSig   contained '\[[a-zA-Z]\]'
syn match   cryModSig   contained '{[a-zA-Z,]}'
hi def link crySeqSig   crySig
hi def link cryModSig   crySig
hi def link crySig      String

" --- Primitive ---
syn region  cryString   start=+"+ skip=+\\\\\|\\"+ end=+"+
hi def link cryString   String

syn match   cryNumber   "\<-\?\d\+\>"
hi def link cryNumber   Number

syn match   cryBool     "True\|False"
hi def link cryBool     Boolean

syn keyword cryConst    inf fin
hi def link cryConst    Constant

" --- Type ---
syn match   cryType     "Bit\|Word\|Char\|String"
hi def link cryType     Type

" --- Module ---
syn keyword cryMod      module import
syn keyword cryType     data type
syn keyword cryDecl     where
hi def link cryMod      cryIncl
hi def link cryType     cryIncl
hi def link cryDecl     cryIncl
hi def link cryIncl     Include

" --- Keyword ---
syn keyword cryCond     case in if then else
syn keyword cryInfix    infix infixl infixr
hi def link cryCond     cryKW
hi def link cryInfix    cryKW
hi def link cryKW       Conditional

" --- Operator ---
syn match   cryBitop    '||\|&&\|\^\|<<<\|<<\|>>>\|>>\|#\|\~'
syn match   cryArith    '+\|-\|*\|/\|\^\^\|%'
syn match   cryBoolop   '==\|!=\|>=\|<=\|<\|>\|='
syn match   cryFuncop   '===\|!=='
syn match   crySeqop    '@@\|@\|!!\|!'
syn match   cryTypeop   '->\|=>\|:'
hi def link cryBitop    cryOp
hi def link cryArith    cryOp
hi def link cryBoolop   cryOp
hi def link cryFuncop   cryOp
hi def link crySeqop    cryOp
hi def link cryTypeop   cryOp
hi def link cryOp       Operator

" --- Function ---
syn match   cryFunc    'lg2\|complement\|negate\|zero\|splitAt\|splitBy\|split'
syn match   cryFunc    'reverse\|transpose\|fromThen\|fromTo\|fromThenTo'
syn match   cryFunc    'infFrom\|infFromThen\|error\|join'
syn match   cryFunc    'pmult\|pdiv\|pmod'
syn match   cryFunc    'take\|drop\|tail\|width\|undefined\|groupBy\|random'
hi def link cryFunc     Keyword

" --- Comment ---
syn match   cryLineComment   "//.*$" contains=cryTodo
syn region  cryBlockComment  start="/\*\+" end="\*\+/" fold contains=cryTodo
hi def link cryLineComment   Comment
hi def link cryBlockComment  Comment

" --- Todo ---
syn keyword cryTodo contained TODO FIXME XXX
hi def link cryTodo Todo

let b:current_syntax = "cryptol"
