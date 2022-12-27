" General Settings
set nu
set hlsearch
set ruler
set bg=dark
set autoindent
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set path=.,/usr/include,,**

" Vundle Settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add plugins below this line
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tyrannicaltoucan/vim-deep-space'

call vundle#end()

filetype plugin indent on

" Color Schemes
colorscheme deep-space
syntax on

" Key Maps
map <silent> <C-n> :NERDTreeToggle<CR>
map <C-_> I// <ESC>j0
inoremap {<CR> {<CR>}<ESC>O

" NERDTree settings
let NERDTreeShowHidden=1

" YCM settings
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
highlight PMenu ctermfg=0 ctermbg=39 guifg=black guibg=deepskyblue1
highlight PMenuSel ctermfg=39 ctermbg=8 guifg=deepskyblue1 guibg=black

