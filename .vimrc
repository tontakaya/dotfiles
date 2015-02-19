"Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,ucs-bom,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2

"Disable beep and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"----------------------------
"indent setting
"----------------------------
"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"シフト移動幅
set shiftwidth=4

"新しい行のインデントを現在行と同じにする
set autoindent

"タブの代わりに空白文字を挿入する
set expandtab

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"----------------------------
"Search setting
"----------------------------
"検索をファイルの先頭へループしない
set wrapscan

" 検索結果をハイライト
set hlsearch

"検索時に大文字と小文字を区別しない
set ignorecase

" esc２回でハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"常にステータスラインを表示する
set laststatus=2

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 

"クリップボードをWindowsと連携
set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示しない
set nolist

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"twigをシンタックスハイライト"
autocmd BufReadPost *.twig set filetype=jinjahtml

""""""""""""""""""""""""""""""""
""""""""key mapping"""""""""""""
""""""""""""""""""""""""""""""""
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 
"バックスペースで改行を消す
set backspace=2
""""""""""""""""""""""""""""""""
""""""""""PHPの設定"""""""""""""
""""""""""""""""""""""""""""""""
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = xcolor>>"" scheme
"
syntax enable
set t_Co=256
"set background=dark
"colorscheme solarized
colorscheme molokai
"let g:solarized_termcolors=256

"NeoBundle系
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif

"--------------------------
" NERDTree
"--------------------------
nmap <C-e> :NERDTreeToggle . "<CR>"
NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
