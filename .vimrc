" Set compatibility to Vim only.
set nocompatible

" === General Config ===

" Line numbers are good
set relativenumber

" Show incomplete commands down the bottom
set showcmd

" Show current mode down the bottom
set showmode

" Reload files changed outside vim
set autoread

" Status Bar
set laststatus=2

" Mouse for all vim modes
set mouse=a

" Turn on syntax highlighting
syntax on

" Enable true colors
set termguicolors

" === Turn Off Swap Files ===

" Disable swap files
set noswapfile

" Disable backup files
set nobackup

" Disable writebackup files
set nowb

" === Plugins (Plug) ===

call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'             " Theme
    Plug 'itchyny/lightline.vim'            " Lightline
    Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair
    Plug 'preservim/nerdtree'               " Tree explorer
call plug#end()

" === Plugins settings ===

" --- Theme ---
colorscheme onedark

" --- Statusbar ---
let g:lightline = {'colorscheme': 'onedark'}

" === NERDTree Mappings ===

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" === Close Tab if NERDTree is the Only Window ===

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

