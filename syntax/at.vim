" Vim syntax file
" Language: AmbientTalk
" Maintainer: Bram Vandenbogaerde
" Latest Revision: 2020-02-13

if exists("b:current_syntax")
  finish
endif

syn keyword defAndImport def deftype import
syn keyword boolean true false
syn match keywordObject "object:"
syn match keywordAs "as:"
syn match keywordActor "actor:"
syn match keywordShare "share:"
syn match keywordExtend "extend:"
syn match keywordExport "export:"
syn match keywordWhen "when:"
syn match keywordWhenever "whenever:"
syn match keywordDiscovered "discovered:"
syn match keywordIfTrue "ifTrue:"
syn match keywordIfFalse "ifFalse:"

syn match number /[0-9]+/
syn match comment "//.*$"

let b:current_syntax = "cel"

hi def link defAndImport Statement
hi def link keywordObject Keyword
hi def link keywordAs Keyword
hi def link keywordActor Keyword
hi def link keywordShare Keyword
hi def link keywordExtend Keyword
hi def link keywordExport Keyword
hi def link reservedLanguageKeywords Keyword
hi def link keywordWhen Keyword
hi def link keywordDiscovered Keyword
hi def link keywordWhenever Keyword
hi def link keywordIfTrue Keyword
hi def link keywordIfFalse Keyword
hi def link comment Comment
hi def link number Number
hi def link boolean Boolean
