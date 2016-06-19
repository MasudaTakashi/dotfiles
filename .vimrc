"---------------------------------------------------------------------------
" for NeoBundle:

if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/
set runtimepath^=~/.vim/bundle/vimproc.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/unite.vim'
if has('lua') && v:version >= 703
    NeoBundleLazy 'Shougo/neocomplete.vim'
else
    NeoBundleLazy 'Shougo/neocomplcache.vim'
endif

" Japanese help
NeoBundle 'vim-jp/vimdoc-ja'
" Vital
NeoBundle 'vim-jp/vital.vim'

" Colorschemes
NeoBundle 'b4b4r07/solarized.vim', { "base" : $HOME."/.vim/colors" }
NeoBundle 'nanotech/jellybeans.vim', { "base" : $HOME."/.vim/colors" }
NeoBundle 'tomasr/molokai', { "base" : $HOME."/.vim/colors" }
NeoBundle 'w0ng/vim-hybrid', { "base" : $HOME."/.vim/colors" }


call neobundle#end()
filetype plugin indent on
NeoBundleCheck



"---------------------------------------------------------------------------
" 編集に関する設定:

" UTF-8のファイルを表示する
set encoding=utf-8
" タブの画面上での幅
set tabstop=4
set shiftwidth=4
" タブをスペースに展開する (noexpandtab:展開しない)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1    " ぶら下り可能幅
" シンタックス
syntax on
" バックアップファイルを作成しない。
set nobackup

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" カラースキーム
syntax enable
set background=dark
colorscheme solarized
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定(表示しないように)
set listchars=
" set listchars=tab:,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表
set showcmd
" タイトルバーの表示を消す
set notitle
" カーソル
set cursorline
highlight CursorLine ctermbg=LightGrey
highlight CursorLine ctermfg=Blue
" fzf
set rtp+=~/.fzf

" autocmplpop.vim関連
"setlocal omnifunc=syntaxcomplete#Complete

"---------------------------------------------------------------------------
" キーバインド:
"vimrcをスペースドットで開く
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
