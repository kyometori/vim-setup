" General Settings
set nocompatible
set nu rnu
set hlsearch
set incsearch
set ruler
set bg=dark
set autoindent
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set path=.,/usr/include,,**
set encoding=UTF-8
set updatetime=100
set showcmd
set showmatch
set matchtime=2
set list listchars=eol:¬,tab:▸\ ,trail:.,
set shiftround

" Leader Key
let mapleader = ";"

call plug#begin('~/.vim/plugins')
" Function Plugins
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'github/copilot.vim'
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }

" Custom Themes
Plug 'sainnhe/everforest'
call plug#end()

filetype plugin indent on

" Color Schemes
set background=dark
if has('termguicolors')
  set termguicolors
endif
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
silent! colorscheme everforest
syntax on

" Key Maps
map <silent> <C-n> :NERDTreeToggle<CR>
map <C-_> I// <ESC>j0
nnoremap <C-q> :m+<CR>
nnoremap <C-j> :m-2<CR>
inoremap <C-q> <ESC>:m+<CR>i
inoremap <C-j> <ESC>:m-2<CR>i
inoremap {<CR> {<CR>}<ESC>O

" Shortcuts
ca Yc YcmCompleter
ca PI PlugInstall

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
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" GitGutter settings
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd guifg=#00BD06 ctermfg=GREEN
highlight GitGutterChange guifg=#27FDD2 ctermfg=CYAN
highlight GitGutterDelete guifg=#EE5C28 ctermfg=RED

" Color
highlight LineNr guifg=#E2F9FF ctermfg=LightCyan

" StatusLine
hi statusline guibg=#8A6ABA
hi statusline guifg=#C0C0C0
set laststatus=2
set statusline=
set statusline+=%#ModeNormalColor#%{mode()=='n'?'\ \ NORMAL\ ':''}
set statusline+=%#ModeInsertColor#%{mode()=='i'?'\ \ INSERT\ ':''}
set statusline+=%#ModeReplaceColor#%{mode()=='R'?'\ \ REPLACE\ ':''}
set statusline+=%#ModeVisualColor#%{mode()=='v'?'\ \ VISUAL\ ':''}
set statusline+=%#ModeNormalColor#%{mode()=='s'?'\ \ SELECT\ ':''}
set statusline+=%#ModeNormalColor#%{mode()=='t'?'\ \ TERMINAL\ ':''}
set statusline+=%#ModeNormalColor#%{mode()=='c'?'\ \ COMMAND\ ':''}
set statusline+=%#ModeNormalColor#%{mode()=='!'?'\ \ SHELL\ ':''}
set statusline+=%2*
set statusline+=%{b:gitbranch}
set statusline+=%3*
set statusline+=\ 
set statusline+=%r " Readonly flag
set statusline+=%f " Filename
set statusline+=%m " Modified flag
set statusline+=%=
set statusline+=%y " Filetype
set statusline+=\ 
set statusline+=%2*
set statusline+=\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'} " Encoding
set statusline+=\[
set statusline+=%{&ff} " File format
set statusline+=\]
set statusline+=\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=%P " Percent
set statusline+=:
set statusline+=%l " Current line number
set statusline+=/
set statusline+=%L " Total line number
set statusline+=:
set statusline+=%n " Buffer number
set statusline+=\ 
hi User1 ctermbg=magenta ctermfg=lightgray guibg=#8A6ABA guifg=#C0C0C0
hi User2 ctermbg=grey ctermfg=magenta guibg=#404040 guifg=#AE4EAF
hi User3 ctermbg=black ctermfg=lightgray guibg=#303030 guifg=#C0C0C0

hi ModeNormalColor ctermbg=magenta ctermfg=lightgray guibg=#8A6ABA guifg=#C0C0C0
hi ModeInsertColor ctermbg=magenta ctermfg=lightgray guibg=#227D54 guifg=#C0C0C0
hi ModeReplaceColor ctermbg=magenta ctermfg=lightgray guibg=#A74464 guifg=#C0C0C0
hi ModeVisualColor ctermbg=magenta ctermfg=lightgray guibg=#CF4E8E guifg=#C0C0C0

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="  ".substitute(l:gitrevparse, '\n', '', 'g')." "
      endif
    catch
    endtry
  endif
endfunction

au! BufEnter * call StatuslineGitBranch()

