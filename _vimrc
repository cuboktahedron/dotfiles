set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

set nocompatible
filetype off

if has('vim_starting')
  if has('win32') || has('win64')
    set backupdir=$VIM/vimfiles/backup
    set runtimepath+=$VIM/vimfiles/bundle/neobundle.vim/
    let bundledir=expand('$VIM/vimfiles/bundle')
  else
    set backupdir=~/dotfiles/vimfiles/backup
    set runtimepath+=~/dotfiles/vimfiles/bundle/neobundle.vim/
    let bundledir='~/dotfiles/vimfiles/bundle/'
  endif
endif

if has('win32') || has('win64')
  if filereadable(expand('$VIM/_vimrc.local'))
    source $VIM/_vimrc.local
  endif
else
  if filereadable(expand('~/_vimrc.local'))
    source ~/_vimrc.local
  endif
endif

call neobundle#begin(bundledir)
NeoBundleFetch 'Shougo/neobundle.vim'

"neobundle自身をneobundleで管理
NeoBundle 'Shougo/neobundle.vim'

"Vundleで管理するプラグイン
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
if has('unix')
  NeoBundle 'Shougo/vimproc'
endif
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'surround.vim'
NeoBundle 'fuenor/im_control.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/vim-haskell-indent'
NeoBundle 'vim-scripts/haskell.vim'
NeoBundle 'cuboktahedron/CD.vim'

NeoBundle 'tyru/open-browser.vim'
NeoBundle 'cuboktahedron/evervim'

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'

call neobundle#end()

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

" タブ関連のショートカット
noremap <Space>tn :tabnew<CR>
noremap <Space>tq :tabclose<CR>


noremap <Space>o :e!<CR>

" カレントディレクトリ移動 
nnoremap <silent> <Space>cd :<C-u>CD<CR>

"" neocomplcacheの設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_compgletion = 1
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

" 「日本語入力固定モード」の動作設定
let IM_CtrlMode = 1

" GVimの時だけ「日本語入力固定モード」の vi協調モードを無効化
let IM_vi_CooperativeMode = has('gui_running') ? 0 : 1

"" im_controlの設定
if !has('gui_running')
  " PythonによるIBus制御指定(コマンドモードに戻ったときにIMEをoffにする)
  let IM_CtrlIBusPython = 1
endif

" ESC実行後のIME自動切替を早くする設定
set timeout timeoutlen=1000 ttimeoutlen=100

" insert時に矢印がABCDになる問題の回避（以下が設定されているとttimeoutlenの設
" 定がきかないのでコメントアウト）
"imap OA <Up>
"imap OB <Down>
"imap OC <Right>
"imap OD <Left>

inoremap '' ''<Left>
inoremap "" ""<Left>

" コマンド履歴を開く
nnoremap <F5> <Esc>q:
nnoremap q: <Nop>

" 検索履歴を開く
nnoremap <F6> <Esc>q/
nnoremap q/ <Nop>
nnoremap q? <Nop>

nnoremap <ESC><ESC> :nohlsearch<CR>

" vimrc
nnoremap <silent> <Space>.  :<C-u>edit $MYVIMRC<CR>

" _vimrc、_gvimrc編集時に自動で再読み込みさせる設定
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

" 矩形選択で文字がないところにもカーソルを移動できるようにする
set virtualedit=block

" 行の折り返しをしないようにする
set nowrap

" インデント変更後も選択状態とする
vnoremap < <gv
vnoremap > >gv


"" over.vimの設定
" over.vimの起動
nnoremap <silent> <Space>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"" yankround.vimの設定
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" 履歴取得数
let g:yankround_max_history = 50

" 履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

nnoremap <Space>el :EvervimNotebookList<CR>
nnoremap <Space>es :EvervimSearchByQuery<Space>
nnoremap <Space>ec :EvervimCreateNote<CR>
nnoremap <Space>et :EvervimListTags<CR>

" markdownの折り畳みをしない
let g:vim_markdown_folding_disabled=1

syntax on
