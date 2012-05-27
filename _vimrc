set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc('~/dotfiles/vimfiles/bundle')

"Vundle自身をVundleで管理
Bundle 'gmarik/vundle'

"Vundleで管理するプラグイン
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
"Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'majutsushi/tagbar'
Bundle 'surround.vim'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'javaScriptLint.vim'

filetype plugin indent on 

"" 一般設定
"タグファイルのファイル名
set tags=.tags;
"非表示文字の表示方法指定
set list listchars=tab:>-,trail:_
"検索文字列のハイライト表示
set hlsearch
""入力行の下線表示
set cursorline
"タブエディタ化
set showtabline=2

noremap <Space>t :tabnew<CR>
noremap <Space>o :e!<CR>

"" neocomplcacheの設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'javascript' : $HOME . '/.vim/dict/javascript.dict'
\ }

" 補完するためのキーワードパターンを指定
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif

" 日本語を補完候補として取得しないようにする
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

""" Uniteの設定
noremap <C-P> :Unite buffer<CR>
noremap <C-Z> :Unite file_mru<CR>

"" netrwの設定
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.svn'
let g:netrw_localcopycmd = "copy"
noremap <SPACE>e :Explore<CR>

" " Change current directory.
" nnoremap <silent> <Space>cd :<C-u>CD<CR>
