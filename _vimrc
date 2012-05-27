set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

set nocompatible
filetype off

set rtp+=~/vimfiles/vundle.git/
call vundle#rc()

"Vundle自身をVundleで管理
Bundle 'gmarik/vundle'

"Vundleで管理するプラグイン
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
undle 'Shougo/vimshell'
"Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'majutsushi/tagbar'
Bundle 'surround.vim'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'javaScriptLint.vim'

filetype plugin indent on 


