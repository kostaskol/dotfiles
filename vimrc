set nocompatible
filetype off

syntax enable
set number relativenumber

" Required to use termguicolors within TMUX
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set termguicolors
" colorscheme desert-night
set background=dark
colorscheme base16-tomorrow-night

hi CursorLine guifg=NONE guibg=#473f31 guisp=NONE gui=NONE cterm=bold

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Konfekt/FastFold'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'vim-polyglot'

" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale.git'

Plugin 'davidhalter/jedi-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'

Plugin 'severin-lemaignan/vim-minimap'

call vundle#end()
filetype plugin indent on

"Enable folding
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

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" Ale
let g:ale_linters = {
\    'python': ['pylint']
\}
let g:ale_open_list = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" CtrlP
let g:ctrlp_map = '<c-p>'

" Various Vim settings
set incsearch
set hlsearch
set nowrap

set undofile
set undodir=~/.vim/undodir

" Ruler
set colorcolumn=120
highlight ColorColumn ctermbg=lightgrey

let g:minimap_highlight='Visual'

set clipboard=unnamedplus

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

set list
set listchars=space:·

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END
