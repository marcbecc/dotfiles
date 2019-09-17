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
else
  if has("win32") || has("win64")
    " how to install automatically on windows? only given powershell command
    
    " python 64bit won't work with 32bit vim. Only python/dyn is installed in
    " gVim
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
filetype plugin on
filetype indent on
set clipboard^=unnamed,unnamedplus

" set wrap
" set linebreak

set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set laststatus=2
set statusline=%f
inoremap jj <esc>
let mapleader = "\\"
set formatoptions-=c
set formatoptions+=n

" use tn as shorthand for tabnew 
cabbrev tn tabnew 

" use :tn as shortcut for :tabnew 
" (this formulation is used instead of 'ca tn tabnew' so it only works w/ :tabnew)
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'

" unfold everything when opening a file
autocmd FileType * exe "normal zR"

" In insert or command mode, move normally by using Ctrl
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
" cnoremap <C-h> <Left>
" cnoremap <C-j> <Down>
" cnoremap <C-k> <Up>
" cnoremap <C-l> <Right>

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
  endif
else
  if has("win32") || has("win64")
    call plug#begin('~/vimfiles/plugged')
    Plug 'C:/ProgramData/chocolatey/bin'
  endif
endif

" color schemes
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'

set termguicolors
let g:gruvbox_italic=1
set background=dark

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
Plug 'sheerun/vim-polyglot'
" Plug 'w0rp/ale'
Plug 'justinmk/vim-dirvish'
Plug 'davidhalter/jedi-vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'zxqfl/tabnine-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'janko-m/vim-test'
" Plug 'nelstrom/vim-visual-star-search'
" Plug 'michaeljsmith/vim-indent-object'

" git plugins
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-git'
" Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'  "requires vim-fugitive, like gitv
" Plug 'gregsexton/gitv', {'on': ['Gitv']} "requires vim-fugitive, like gitk

" markdown plugins (vim-markdown requires tabular before it)
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'junegunn/goyo.vim'
" Plug 'fmoralesc/vim-pad'

" make sure to download exuburant Ctags along with this
Plug 'ludovicchabant/vim-gutentags'
Plug 'lifepillar/vim-mucomplete'

" Plug 'neoclide/coc.nvim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Initialize plugin system
call plug#end()

try
  colorscheme gruvbox
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

" render latex math (using eg: $f(x)=y$) in vim-markdown 
let g:vim_markdown_math = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Configure language servers for asyncomplete
" if executable('pyls')
"   " pip install python-language-server
"   au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
" endif

" Requires llvm/clangd
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd', '-background-index']},
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"         \ })
" endif

" Requires luarocks. https://github.com/Alloyed/lua-lsp
" if executable('lua-lsp')
"     au User lsp_setup call lsp#register_server({
"                 \ 'name': 'lua-lsp',
"                 \ 'cmd': {server_info->[&shell, &shellcmdflag, 'lua-lsp']},
"                 \ 'whitelist': ['lua'],
"                 \ })
" endif

" omnicomplete
" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"   \ 'name': 'omni',
"   \ 'whitelist': ['*'],
"   \ 'blacklist': ['c', 'cpp', 'html'],
"   \ 'completor': function('asyncomplete#sources#omni#completor')
" \  }))

" asyncomplete tab completion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" VIM NOTES
"
" To delete without saving it to register, use "_d
"
" print where map is being used (eg ctrl-Return>: :verbose inoremap <C-Return>
