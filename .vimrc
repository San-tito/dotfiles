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
    Plug 'folke/tokyonight.nvim'
    Plug '~/.vim/plugged/tokyonight.nvim/extras/vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber   " Line numbers are good
set cmdheight=2             " Height of the command bar
set expandtab               " Always use spaces instead of tab characters
set showcmd                 " Show incomplete commands down the bottom
set showmode                " Show current mode down the bottom
set autoread                " Reload files changed outside vim
set laststatus=2            " Status Bar
set mouse=a                 " Mouse for all vim modes
set termguicolors           " Enable true colors
set cmdheight=2             " Height of the command bar
set incsearch               " Makes search act like search in modern browsers
set showmatch               " show matching brackets when text indicator is over them
set scrolloff=10            " Make it so there are always ten lines below my cursor
syntax on                   " Turn on syntax highlighting
filetype plugin indent on   " Load filetype-specific indent files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Want auto indents automatically
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set cindent
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set the width of the tab to 4 wid
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn Off Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE
colorscheme tokyonight-night

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <left>        :echom "Use h to move!!"<CR>
nnoremap <right>       :echom "Use l to move!!"<CR>
nnoremap <up>          :echom "Use k to move!!"<CR>
nnoremap <down>        :echom "Use j to move!!"<CR>
inoremap <left>   <C-o>:echom "Use h to move!!"<CR>
inoremap <right>  <C-o>:echom "Use l to move!!"<CR>
inoremap <up>     <C-o>:echom "Use k to move!!"<CR>
inoremap <down>   <C-o>:echom "Use j to move!!"<CR>
