set encoding=utf-8
scriptencoding utf-8

set nocompatible
filetype off

syntax enable
set number relativenumber

" Required to use termguicolors within TMUX
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set termguicolors

hi CursorLine guifg=NONE guisp=NONE gui=NONE cterm=bold

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'majutsushi/tagbar'

Plugin 'jonathanfilip/vim-lucius'

Plugin 'davidhalter/jedi-vim'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'Vimjas/vim-python-pep8-indent'

Plugin 'tweekmonster/impsort.vim'

Plugin 'wsdjeg/FlyGrep.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'roxma/nvim-yarp'

Plugin 'ncm2/ncm2'

Plugin 'ncm2/ncm2-bufword'

Plugin 'ncm2/ncm2-path'

Plugin 'ncm2/ncm2-jedi'

Plugin 'Konfekt/FastFold'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'vim-polyglot'

Plugin 'w0rp/ale.git'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'

Plugin 'severin-lemaignan/vim-minimap'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
" filetype plugin indent on
filetype indent plugin on

" Enable folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

" SimpylFold
let g:SimpylFold_docstring_preview = 1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set cursorline
set showmatch

let python_highlight_all = 1

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" CtrlP
let g:ctrlp_map = '<c-p>'

" Various Vim settings
set incsearch
set hlsearch
set cpoptions+=x " Stay at search item when pressing <esc>
set nowrap

set undofile
set undodir=~/.vim/undodir

" Ruler
set colorcolumn=80,120
highlight ColorColumn ctermbg=lightgrey

set mouse=a
set smartcase
set wrapscan
set clipboard=unnamedplus

" Easy split movement

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:lucius_style="dark"
let g:lucius_contrast="high"
colorscheme lucius
set background=dark

" if has ("autocmd")
"     autocmd BufEnter * call ncm2#enable_for_buffer()
" endif

set completeopt=menuone,noselect,noinsert
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" set pumheight=5

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ? "\<c-y>\<cr>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif


set list
" `tab` in the following contains two
" characters (a » and an invisible unicode character (U-2800)
set listchars=space:·,tab:»⠀
set autoread

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" solid underscore
" let &t_SI .= "\<Esc>[5 q"
" " solid block
" let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

map <F3> :NERDTreeToggle<CR>

let g:NERDTREEWinSize=20

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Tabs
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
