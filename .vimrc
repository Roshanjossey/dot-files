set nocompatible " Fuck VI... That's for grandpas.
filetype off
"------------------------------------------------------------------------------
"                              Plugins
"
"------------------------------------------------------------------------------
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
" Snippets engine
Plugin 'SirVer/ultisnips'
" Snippets
Plugin 'honza/vim-snippets'
" Super tab says it'll take care of all completons using <tab>
Plugin 'ervandew/supertab'
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
" Extend funtionality of . repeat to plugin functions too
Plugin 'tpope/vim-repeat'
" That cool status bar I've been seeing
Plugin 'bling/vim-airline'
" undo tree
Plugin 'sjl/gundo.vim'

" Html css
" emmet for some cool html wrangling
Plugin 'mattn/emmet-vim'
" html5
Plugin 'othree/html5.vim'
" css color
Plugin 'ap/vim-css-color'

" Python

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box. 
Plugin 'klen/python-mode', { 'for': ['python'] }
" Flake8 plugin for Vim for python 
Plugin 'nvie/vim-flake8'

" Ruby/Rails

" Ruby plugin
Plugin 'vim-ruby/vim-ruby'
" endwise will end things that I start
Plugin 'tpope/vim-endwise'
" rails support
Plugin 'tpope/vim-rails'
" bundler integration (e.g. :Bopen)
Plugin 'tpope/vim-bundler'
" rake integration
Plugin 'tpope/vim-rake'
" ruby refactoring
Plugin 'ecomba/vim-ruby-refactoring'
" apidock.com docs integration
Plugin 'apidock.vim'
" toggle ruby blocks style
Plugin 'vim-scripts/blockle.vim'
" lightweight Rspec runner for Vim
Plugin 'josemarluedke/vim-rspec'

" Javascript

" support for common js libraries, frameworks
Plugin 'othree/javascript-libraries-syntax.vim'
" termination of syntax
Plugin 'ternjs/tern_for_vim'
" js syntax, indentaion support
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end() 
 
 
" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set number " Turn on line numbers 
set relativenumber " This provides the current line number and others relatives
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
" Default is \ but lets use ,
" Whaterver you see with <leader> in shortcut, ',' in place of <leader>
let mapleader = ","

"Folding
set foldmethod=indent
set foldlevel=99
 
 
" So we don't have to press shift when we want to get into command mode.
" This has a perk of inablility to use ; when using f to find
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

" workaround for removing file but not split
nmap <leader>q :b#<bar>bd#<bar>b<CR>

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
"------------------------You complete me---------------------------------
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

function! g:UltiSnips_Reverse()
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
        return "\<C-P>"
    endif

    return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
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
let g:syntastic_always_populate_loc_list = 1 "This will put errors in vim's default thingy
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 "Don't wanna be bugged when closing right?

let g:syntastic_quiet_messages = { 'regex': '#include.*' }

"------------------------ctrl p stuff-----------------------------------------
" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30
" ctrlp -ing buffers 
map <leader>b :CtrlPBuffer<cr>
" ctrlp -ing mrus 
map <leader>m :CtrlPMRUFiles<cr>
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

"---------------------------js libraries----------------------------------------
let g:used_javascript_libs = 'underscore,backbone,jasmine'
"---------------------------colorscheme----------------------------------------

colorscheme molokai
