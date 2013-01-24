"常にステータスラインを表示する
set laststatus=2

"検索時に大文字と小文字を区別しない
set ignorecase

"新しい行のインデントを現在行と同じにする
set autoindent

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

"タブの代わりに空白文字を挿入する
set expandtab

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

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
set nowrapscan

" 検索結果をハイライト
set hlsearch

" esc２回でハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"シフト移動幅
set shiftwidth=4

"ファイルタイプによってインデント幅を変更する
"au BufNewFile,BufRead *.py set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""
""""""""key mapping"""""""""""""
""""""""""""""""""""""""""""""""
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 
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

call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'The-NERD-tree'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'grep.vim'

"color scheme
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin on
filetype indent on

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
" ---------------------------
"  neocomplcache
"  --------------------------
"
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" ディクショナリ定義
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'php' : $HOME . '/.vim/dict/php.dict',
"    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
"    \ }

if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()

" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
"補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" <C-h>や<BS>を押したときに確実にポップアップを削除します
noremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じます
"inoremap <expr><C-e> neocomplcache#cancel_popup()

