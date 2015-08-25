set nocompatible " Fuck VI... That's for grandpas.
filetype off
"------------------------------------------------------------------------------
"                              Plugins
"
"------------------------------------------------------------------------------
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Plugin 'githubUsername/repoName'
 
" Let vundle manage itself:
Plugin 'gmarik/vundle'
" Syntax checking plugin
Plugin 'scrooloose/syntastic'
" File system
Plugin 'scrooloose/nerdtree'
" Just a shitload of color schemes.
Plugin 'flazz/vim-colorschemes'
" Autocompletion
Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'
" Go plugin
Plugin 'fatih/vim-go'
" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'
" Easily enclose stuff in ', ", (, {
Plugin 'tpope/vim-surround'
" Control git commands from vim
Plugin 'tpope/vim-fugitive'
" Using some cool key bindings from vimscript legend Tim Pope
Plugin 'tpope/vim-unimpaired'
" That cool status bar I've been seeing
Plugin 'bling/vim-airline'
" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box. 
Plugin 'klen/python-mode', { 'for': ['python'] }
" Flake8 plugin for Vim 
Plugin 'nvie/vim-flake8'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call vundle#end() 
 
 
" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set number " Turn on line numbers 
" set background=dark " background
set t_Co=256 " 256 color on terminal
" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?
 
" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.
 
" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.
 
" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
 
" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

"Folding
set foldmethod=indent
set foldlevel=99
 
 
" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :
 
" So we don't have to reach for escape to leave insert mode.
inoremap jk <esc>
 
" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v
 
" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
 
" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>
 
"Fixing problem of tmux interfering with background
if exists('$TMUX')
  set term=screen-256color
endif
 
" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk


"**************On Splits*****************
" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
" create new hsplit, switch to it. 
noremap <leader>s <C-w>s
" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 
" opening splits right and below
set splitbelow
set splitright
"****************************************************************************
"                   Functions to Session Store and Load
"         Commands  MakeSession  LoadSession
"----------------------------------------------------------------------------
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()
" ---------------------------------------------------------------------------
"                           Plugin settings
 
"------------------------commentary stuff---------------------------------
" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine
"-------------------------airline stuff---------------------------------------
"airline
set laststatus=2
"airline tabline
let g:airline#extensions#tabline#enabled = 1
"airline theme
let g:airline_theme="badwolf"
"airline uses powerline fonts
let g:airline_powerline_fonts = 1
"------------------------syntastic stuff--------------------------------------
"For removing scratch preview on moving or leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"------------------------ctrl p stuff-----------------------------------------
" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
"let g:ctrlp_map = '<c-t>'
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30
" ctrlp -ing buffers 
map <leader>b :CtrlPBuffer<cr>
"----------------------------vim-go stuff-------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

"---------------------------snippets------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"---------------------------colorscheme----------------------------------------

colorscheme molokai
