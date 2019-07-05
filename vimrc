set nocompatible
filetype off

syntax enable
set relativenumber

let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

set termguicolors
colorscheme desert-night

hi CursorLine guifg=NONE guibg=#473f31 guisp=NONE gui=NONE cterm=bold

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Konfekt/FastFold'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'vim-polyglot'

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
