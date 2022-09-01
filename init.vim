call plug#begin(stdpath('data') . '/plugged')

Plug 'pechorin/any-jump.vim'



" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme spaceduck
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

" Initialize plugin system
call plug#end()

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
set clipboard=unnamed " provide clipboard
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

"Use w!! to save file with root access
cnoremap w!! w !sudo tee % >/dev/null


nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" leader is a key that allows you to have your own "namespace" of keybindings.
" Default is \ but lets use ,
" Whaterver you see with <leader> in shortcut, ',' in place of <leader>
let mapleader = "\ "

"Folding
set foldmethod=indent
set foldlevel=99
 
 
" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :
" Also lets use : to find next character when searching with f
nnoremap : ;
vnoremap : ;
 
" So we don't have to reach for escape to leave insert mode.
inoremap jk <esc>
" In insert mode, use ao to edit on the line above
inoremap ao <esc>O
 
" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v
 
" Clear match highlighting
noremap <leader>g :noh<cr>:call clearmatches()<cr>
 
" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" grep word under cursor
nnoremap <leader>* :Ack<cr>

" close quickfix
nnoremap <leader>q :ccl<cr>


"________________On Splits___________________

" workaround for removing file but not split
nnoremap <leader>x :b#<bar>bd#<bar>b<CR>
" Remove the pipe characters in between splits
set fillchars+=vert:\ 

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
" create new hsplit, switch to it. 
noremap <leader>s <C-w>s
" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 
" open splits right and below
set splitbelow
set splitright

"___________________FZF____________________
"
silent! nmap <leader>f :call fzf#vim#gitfiles()<cr>


"________________airline___________________
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme="murmur"

"________________any jump___________________

" Normal mode: Jump to definition under cursore
nnoremap <leader>j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>

hi Pmenu guibg=#1b1b1b ctermbg=232


colorscheme spaceduck
