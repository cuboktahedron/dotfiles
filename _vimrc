set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

set nocompatible
filetype off

if has('vim_starting')
  if has('win32' || 'win64')
    set rtp+=$VIM/vimfiles/bundle/bundle/
    call vundle#rc('$VIM/vimfiles/bundle')
  else
    set rtp+=~/dotfiles/vimfiles/vundle.git/
    set rtp+=~/dotfiles/vimfiles/
    set rtp+=~/dotfiles/vimfiles/after/
    call neobundle#rc('~/dotfiles/vimfiles/bundle')
  endif
endif

"neobundle自身をneobundleで管理
NeoBundle 'Shougo/neobundle.vim'

"Vundleで管理するプラグイン
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'surround.vim'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'cuboktahedron/CD.vim'

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

" カレントディレクトリ移動 
nnoremap <silent> <Space>cd :<C-u>CD<CR>

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

"" im_controlの設定
if !has('gui_running')
  " PythonによるIBus制御指定(コマンドモードに戻ったときにIMEをoffにする)
  let IM_CtrlIBusPython = 1
endif

"" insert時に矢印がABCDになる問題の回避
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

inoremap '' ''<Left>
inoremap "" ""<Left>
