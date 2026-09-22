" General Settings
set nocompatible
set encoding=UTF-8
set hidden
set autoindent
set backspace=2

set nu rnu
set ruler
set showcmd
set sloc=statusline
set signcolumn=yes
set splitbelow
set splitright

set scrolloff=6

set hlsearch
set incsearch
set ignorecase
set smartcase

set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

set showmatch
set matchtime=2
set formatoptions-=cro

set list listchars=eol:¬,tab:▸\ ,trail:.,
set path=.,/usr/include,,**
set updatetime=750
set timeout
set timeoutlen=400

let s:undo_dir = expand('~/.vim/undo')

if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif

let &undodir = s:undo_dir
set undofile

" Leader Key
let mapleader = ";"

call plug#begin('~/.vim/plugins')
" Function Plugins
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'github/copilot.vim'
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'tommcdo/vim-exchange', { 'on': 'Exchange' }
Plug 'lervag/vimtex'

" Custom Themes
Plug 'sainnhe/everforest'
Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }
call plug#end()

filetype plugin indent on

" Color Schemes
set background=dark
if has('termguicolors')
  set termguicolors
endif
" let g:everforest_background = 'hard'
" let g:everforest_better_performance = 1
set bg=dark
silent! colorscheme catppuccin
syntax on

" Key Maps
map <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <C-q> :m+<CR>
nnoremap <C-j> :m-2<CR>
inoremap <C-q> <ESC>:m+<CR>i
inoremap <C-j> <ESC>:m-2<CR>i
inoremap {<CR> {<CR>}<ESC>O

" Mark Enhancement
function s:SelectMark(command)
  execute "marks"
  echohl Question
  echo "Enter mark (ESC to cancel): "
  echohl NONE
  let mark = nr2char(getchar())
  redraw
  if mark !=# "\e"
    try
      if mode("v:true") ==? "v" && line("'" .. mark) ==# 0
        throw "E20: Mark not set"
      endif
      execute "normal! " .. a:command .. mark
    catch
      echohl ErrorMsg
      echo substitute(v:exception, "^Vim(.*):", "", "")
      echohl NONE
    endtry
  endif
endfunction

nnoremap ' <Cmd>call <SID>SelectMark("'")<CR>
nnoremap ` <Cmd>call <SID>SelectMark("`")<CR>

xnoremap ' <Cmd>call <SID>SelectMark("'")<CR>
xnoremap ` <Cmd>call <SID>SelectMark("`")<CR>


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
set statusline+=\ %{FugitiveHead()}\ 
set statusline+=%3*
set statusline+=\ 
set statusline+=%r " Readonly flag
set statusline+=%f " Filename
set statusline+=%m " Modified flag
set statusline+=\ 
set statusline+=%S " sloc
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
