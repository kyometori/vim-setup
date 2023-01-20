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
set encoding=UTF-8
set updatetime=100

" Vundle Settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Add plugins below this line
" Function Plugins
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
" Custom Themes
Plugin 'sainnhe/everforest'
Plugin 'sonph/onehalf'

call vundle#end()

filetype plugin indent on

" Color Schemes
set background=dark
set termguicolors
colorscheme everforest
syntax on

" Key Maps
map <silent> <C-n> :NERDTreeToggle<CR>
map <C-_> I// <ESC>j0
nnoremap <C-q> :m+<CR>
nnoremap <C-j> :m-2<CR>
inoremap <C-q> <ESC>:m+<CR>i
inoremap <C-j> <ESC>:m-2<CR>i
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
highlight PMenu ctermfg=0 ctermbg=10 guifg=black guibg=#4FBD65
highlight PMenuSel ctermfg=10 ctermbg=8 guifg=#4FBD65 guibg=black

" Airline settings
let g:airline_theme='violet'

" GitGutter settings
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd guifg=#00BD06 ctermfg=GREEN
highlight GitGutterChange guifg=#27FDD2 ctermfg=CYAN
highlight GitGutterDelete guifg=#EE5C28 ctermfg=RED

" Color
highlight LineNr guifg=#E2F9FF ctermfg=LightCyan
