"     _____             __  _ __
"    / ___/____ _____  / /_(_) /_____
"    \__ \/ __ `/ __ \/ __/ / __/ __ \   Santito
"   ___/ / /_/ / / / / /_/ / /_/ /_/ /   https://github.com/San-tito
"  /____/\__,_/_/ /_/\__/_/\__/\____/    https://gitlab.com/santito
"

set nocompatible              " Set compatibility to Vim only.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (Plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"{{ Theme }}
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
"{{ File management }}
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
"{{ Utility }}
    Plug 'jiangmiao/auto-pairs'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber   " Line numbers are good
set showcmd                 " Show incomplete commands down the bottom
set showmode                " Show current mode down the bottom
set autoread                " Reload files changed outside vim
set laststatus=2            " Status Bar
set mouse=a                 " Mouse for all vim modes
set termguicolors           " Enable true colors
syntax on                   " Turn on syntax highlighting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn Off Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile              " Disable swap files
set nobackup                " Disable backup files
set nowb                    " Disable writebackup files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark
highlight Normal guibg=NONE ctermbg=NONE    
let g:lightline = {'colorscheme': 'onedark'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <left> :echo "Use h to move!!"<CR>
nnoremap <right> :echo "Use l to move!!"<CR>
nnoremap <up> :echo "Use k to move!!"<CR>
nnoremap <down> :echo "Use j to move!!"<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === Close Tab if NERDTree is the Only Window ===
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

