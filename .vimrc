set encoding=utf-8
scriptencoding utf-8

set nocompatible
filetype off

syntax enable
set number relativenumber

" Required to use termguicolors within TMUX
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

set termguicolors

hi CursorLine guifg=NONE guisp=NONE gui=NONE cterm=bold

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
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

" Airline
let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_chalk'
let g:airline_theme='onehalfdark'

" CtrlP
" let g:ctrlp_map = '<c-p>'


" Various Vim settings
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>
set cpoptions+=x " Stay at search item when pressing <esc>
set nowrap

set undofile
set undodir=~/.vim/undodir

" Ruler
set colorcolumn=120
highlight ColorColumn ctermbg=lightgrey

set mouse=a
set smartcase
set wrapscan
set clipboard=unnamed

" Easy split movement

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set background=dark
" ==================
" || Lucius Theme ||
" ==================
" let g:lucius_style="light"
" let g:lucius_contrast="high"
" colorscheme lucius
" ===================
" || Gruvbox Theme ||
" ===================
" colorscheme gruvbox
" let g:gruvbox_italic = 0
" let g:gruvbox_contrast_dark = 'medium'
" ===============
" || One Theme ||
" ===============
" colorscheme one
colorscheme onehalfdark

set completeopt=menuone,noselect,noinsert
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ? "\<c-y>\<cr>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

if has("autocmd")
    au BufReadPost ?* if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif


set list
" `tab` in the following contains two
" characters (a » and an invisible unicode character (U-2800)
set listchars=tab:»⠀
set autoread
au CursorHold,CursorHoldI * checktime
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
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
map <S-h> :tabp<CR>
map <S-l> :tabn<CR>
" Creates a new tab with the current file's contents
map <leader>u :tab split<CR>
map <leader>v :vsplit<CR>
map <leader>h :split<CR>

" Markdown Preview
let vim_markdown_preview_toggle=3
let vim_markdown_preview_hotkey='<C-l>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_use_xdg_open=1

let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio']
    \ }

" fzf configuration
" Jump to an existing buffer if possible
let g:fzf_buffers_jump = 1

" Customize the options used by 'git log'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let g:fzf_tags_command = 'ctags -R'

nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>p        :Files<CR>
nnoremap <leader>t        :Tags<CR>
nnoremap <leader>g        :BTags<CR>
nnoremap <leader>b        :Gblame<CR>

" gutentags
" let g:gutentags_ctags_exclude=["node_modules", "plugged", "tmp", "temp", "log",
"        \"vendor", "test", "spec", "app/assets", "*.js", "*.go", "*.css", "*.html",
"              \"*.jsx", "*.json", ".yaml", "test"]

" TagBar
nnoremap <F2> :Tagbar<CR>

" Statusline
" set statusline+=%{gutentags#statusline()}

