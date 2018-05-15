filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" show line number
set number

" leader is ,
let mapleader=","
syntax on

" map esc to jk
:imap jj <Esc>

" map fh to tabnext and ff to tabprevious
:nnoremap fj :tabnext<CR>
:nnoremap ff :tabprevious<CR>

let python_highlight_all=1

" syntastic
let g:syntastic_javascript_checkers = ['eslint']

" Mouse for nvim
if !has('nvim')
    set ttymouse=xterm2
endif

" copy clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yG  "+yG

" auto complete enhance
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_add_preview_to_completeopt=1
set pumheight=5
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" no highlight map
nmap <leader>/ :noh<CR>
nmap <Esc> :noh<CR>

" map copen
:nmap <leader>co :copen<CR>

"change register
map <leader>p "_

"map <leader>v to open vimrc
:nnoremap <leader>v :tabnew ~/.vimrc<CR>

" colorscheme
colorscheme dracula

" utilsnips conf
let g:UltiSnipsExpandTrigger="<c-b>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" goyo
let g:livedown_browser = "firefox"

" NerdTree confs
" nerdtree win size
"let g:NERDTreeWinSize=20 
let g:nerdtree_tabs_open_on_console_startup=2
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <C-i> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Map multiple cursors
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-a>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<ESC>'

" Map tagbar
nmap <F8> :TagbarToggle<CR>

" Map prettier
nmap <leader>py <Plug>(Prettier)
let g:prettier#exec_cmd_path = "~/.config/yarn/global/node_modules/prettier-eslint/node_modules/prettier/bin/prettier.js"

" Gdiff open vertical
set diffopt+=vertical

" Statusline conf
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" delete trailing whitespaces with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" ayu theme
Plug 'ayu-theme/ayu-vim'
" File navigation right sidebar
Plug 'majutsushi/tagbar'
" markdown live
Plug 'shime/vim-livedown'
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
" plugin on GitHub repo
Plug 'scrooloose/nerdtree'
" syntax checking
Plug 'vim-syntastic/syntastic'
" PEP 8
Plug 'nvie/vim-flake8'
" auto complete
Plug 'Valloric/YouCompleteMe'
" colorschemes
Plug 'flazz/vim-colorschemes'
" nerdtree tabs
Plug 'jistr/vim-nerdtree-tabs'
" orgmode
Plug 'jceb/vim-orgmode'
" Beautiful icons
Plug 'ryanoasis/vim-devicons'
" Color to the icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Vim jsx highlight and ident
Plug 'mxw/vim-jsx'
" ctrl p
Plug 'kien/ctrlp.vim'
" for python identation
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Multiple cursors in vim
Plug 'terryma/vim-multiple-cursors'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Poweline
Plug 'vim-airline/vim-airline'
" Git signs in gutter
Plug 'airblade/vim-gitgutter'
" Snippets engine
Plug 'SirVer/ultisnips'
" Snippets
Plug 'honza/vim-snippets'
" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" All of your Plugins must be added before the following line
call plug#end()
"call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf8
set guifont=Droid\ 12

" Change between relative number
function! NumberToggle()
  if(&relativenumber == 1)
      set norelativenumber
  else
      set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Two spaces, 4 is too much 
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
