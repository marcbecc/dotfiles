set nocompatible

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif
  if s:uname == "Linux\n"
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif
else
  if has("win32") || has("win64")
    " how to install automatically on windows? only given powershell command

    " python 64bit won't work with 32bit vim. Only python/dyn is installed in gVim
    let $PYTHONHOME = 'C:/Users/marcb/Anaconda3/' 
  endif
endif

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set visualbell
set autoread
set hidden
syntax on
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cursorline
set lazyredraw
set mouse=a
set ignorecase
set smartcase
" set ttyfast
filetype plugin on
filetype indent on
set clipboard^=unnamed,unnamedplus
set formatoptions-=ct

" set wrap
" set linebreak

set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set laststatus=2
set statusline=%f
let mapleader = "\\"
inoremap jj <esc>

" use tn as shorthand for tabnew
cabbrev tn tabnew 

" use :tn as shortcut for :tabnew
" (this formulation is used instead of 'ca tn tabnew' so it only works w/ :tabnew)
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'

""auto close {
"function! s:CloseBracket()
"    let line = getline('.')
"    if line =~# '^\s*\(struct\|class\|enum\) '
"        return "{\<Enter>};\<Esc>O"
"    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
"        " Probably inside a function call. Close it off.
"        return "{\<Enter>});\<Esc>O"
"    else
"        return "{\<Enter>}\<Esc>O"
"    endif
"endfunction
"inoremap <expr> {<Enter> <SID>CloseBracket()

" inoremap (; (<CR>);<C-c>O
" inoremap (, (<CR>),<C-c>O
" inoremap {; {<CR>};<C-c>O
" inoremap {, {<CR>},<C-c>O
" inoremap [; [<CR>];<C-c>O
" inoremap [, [<CR>],<C-c>O

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" in visual mode, replace selected text with register with r
vmap r "_dP

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    call plug#begin('~/.vim/plugged')
    Plug '/usr/local/opt/fzf'
  else
    call plug#begin('~/.vim/plugged')
    Plug '/home/marc/.fzf/bin/fzf'
  endif
elseif has("win32") || has("win64")
  call plug#begin('~/vimfiles/plugged')
  Plug 'C:/ProgramData/chocolatey/bin'
endif

if &term =~ "nvim\\|rxvt"
  set notermguicolors
  let g:gruvbox_italic=1
else
  set termguicolors
endif

" color schemes
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'gruvbox-community/gruvbox'
Plug 'noahfrederick/vim-noctu'  " uses terminal theme, 16 colors
Plug 'noahfrederick/vim-hemisu' " like noctu theme but works with gui too
Plug 'dylanaraps/wal.vim' " works with pywal (noctu might be better..)

" change cursor shape in different modes (only for VTE compatible terms)
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo' 
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
" Plug 'sheerun/vim-polyglot'
" Plug 'w0rp/ale'
" Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/matchit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git plugins
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-git'
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" This is causing some weird syntax highlighting 
" Plug 'vim-pandoc/vim-pandoc' "also for markdown support
" Plug 'vim-pandoc/vim-pandoc-syntax'

" distraction-free writing
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" make sure to download exuburant Ctags along with this
Plug 'lifepillar/vim-mucomplete'
Plug 'ludovicchabant/vim-gutentags'

" coc.nvim - requires nodejs. Install with:
" sudo curl -sL install-node.now.sh/lts | sudo bash
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" see additional extensions: coc-git (replaces git-gutter) 
"                            coc-tabnine (AI intellisense)

" Initialize plugin system
call plug#end()

" this and other terminal codes are ignored by neovim
set t_Co=256 

" fix background color erase
" set t_ut=
" let g:dracula_colorterm = 0
let g:gruvbox_guisp_fallback='bg' " fixes issues with ALE on terminal
set background=dark

" let g:airline_theme = 'wal'
" set bg=light
" colorscheme noctu
try
  colorscheme gruvbox
  " colorscheme dracula
  " to enable transparancy with vim (with it enabled in terminals too)
  highlight Normal guibg=NONE ctermbg=NONE
  " highlight nonText ctermbg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme desert
endtry

if has('gui_running')
  if has('gui_win32')
    set guifont=Consolas:h10
    set lines=80 columns=125 linespace=0
  else
    "
  endif
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" VIM NOTES
"
" To delete without saving it to register, use "_d
" Jump back and forth in normal: c-o c-i  (see :help jumplist)
" Jump to last change you made: ' and . 
" To see list of changes use :changes
"
" Insert mode commands: (see :help ins-special-keys)
"
" wrap entire line in surrounding with yss__
"
" To automatically split line in normal mode use: gql 
" (splits where the line is wrapped)
"
" If vim becomes frozen, you might have hit Ctrl+s on accident. Can unfreeze
" with Ctrl+q
"
" To get setting, use either :set <whatever>? or :echo &<whatever>
" (not sure of the differences) 
