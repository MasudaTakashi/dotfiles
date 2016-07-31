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
NeoBundle 'Shougo/unite.vim'
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
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim', { "base" : $HOME."/.vim/colors" }
NeoBundle 'tomasr/molokai', { "base" : $HOME."/.vim/colors" }
NeoBundle 'w0ng/vim-hybrid', { "base" : $HOME."/.vim/colors" }
" lightline
NeoBundle 'itchyny/lightline.vim'

" ctags
NeoBundle 'szw/vim-tags'
NeoBundle 'tsukkee/unite-tag'

" syntax check
NeoBundle 'scrooloose/syntastic'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


"---------------------------------------------------------------------------
" Basic Setting

let mapleader = "\<Space>"
" encode utf-8
set encoding=utf-8
" not create swap file
set noswapfile
" not create backup file
set nobackup
" share clipboard
set clipboard+=unnamed
" reload if file is editted
set autoread

" save
nnoremap <Leader>w :w<CR>
" save and close
nnoremap <Leader>x :x<CR>
" quick not save
nnoremap <Leader>q :q<CR>

" search
set hlsearch    " 検索文字列をハイライトする
set incsearch   " インクリメンタルサーチを行う
set ignorecase  " 大文字と小文字を区別しない
set smartcase   " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan    " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault    " 置換の時 g オプションをデフォルトで有効にする

"---------------------------------------------------------------------------
" Edit Setting

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" tab size
set tabstop=4
set shiftwidth=4
" タブをスペースに展開する
set expandtab
" 自動的にインデントする
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 括弧入力時に対応する括弧を表示
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1    " ぶら下り可能幅


"---------------------------------------------------------------------------
" Display Setting

" color scheme (solarized dark)
syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=16
set background=dark
colorscheme solarized
" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
" 行番号を非表示
set number
" ルーラーを表示
set ruler
" 不可視文字を表示
set list
set listchars=tab:▸\ ,trail:_,extends:❯,precedes:❮
" 長い行を折り返して表示
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルバーの表示を消す
set notitle
" カーソル
"highlight CursorLineNr ctermbg=4 ctermfg=White
set cursorline
"highlight clear CursorLine
highlight CursorLine ctermbg=4 ctermfg=White cterm=None term=reverse
" fzf
set rtp+=~/.fzf


"---------------------------------------------------------------------------
" Key Bind

" vimrcをスペースドットで開く
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ctags
" 定義元ジャンプ時に新しいタブで開く
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" タブ移動
" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 "常にタブラインを表示

" prefix key
nnoremap    [Tag] <Nop>
nmap    s [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
:
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast<bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>

