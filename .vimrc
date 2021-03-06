" Basics {{{
set shell=/bin/bash
set nocompatible                             " be iMproved
set backspace=2                              " Make backspace work
filetype off                                 " Vundle needs this

set visualbell
set noerrorbells                             " Don't beep.
" }}}
" Plugins {{{
set rtp+=/usr/local/opt/fzf                  " If fzf installed using Homebrew
set rtp+=~/.vim/bundle/Vundle.vim            " Vundle installed using git checkout

" Vundle plugins 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'                  " Git
Plugin 'vim-airline/vim-airline'             " Nice status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'              " Git diff in the gutter (next to line numbers)
Plugin 'w0rp/ale'                            " Syntax check, linters and stuff
Plugin 'scrooloose/nerdtree'                 " Fancy file tree browser
Plugin 'junegunn/fzf'                        " Fuzzy file name search
Plugin 'junegunn/fzf.vim'
Plugin 'Gundo'                               " Interactive visual undo tree
Plugin 'NLKNguyen/papercolor-theme'          " https://vimawesome.com/plugin/papercolor-theme

call vundle#end()
filetype plugin indent on                    " Required by Vundle

" close when NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" this output doesn't include symlinks, so less duplicates in output
let $FZF_DEFAULT_COMMAND = 'find . -type f | grep -v ".git"'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}
" Syntax Checking {{{
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" Run both javascript and vue linters for vue files.
let b:ale_linter_aliases = ['javascript', 'vue']
" Select the eslint and vls linters.
let b:ale_linters = ['eslint', 'vls']

let g:ale_fixers = { 'javascript': ['eslint']}
" }}}
" Folding {{{
set foldenable                               " enable folding
set foldlevelstart=10                        " open most folds by default
set foldnestmax=10                           " 10 nested fold max
nnoremap <space> za                          " space open/closes folds
" }}}
" Colors {{{
set t_Co=256
set background=dark
colorscheme PaperColor
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
" }}}
" UI Layout {{{
set laststatus=2                             " Always show the status line (bottom of the screen)
set listchars=tab:>-,trail:.                 " Show all tabs and trailing spaces
set list                                     " Show tabs and spaces
set number                                   " Show line numbers.
set rnu                                      " Show relative line numbers.
set tabstop=2                                " Display tab as two spaces wide
set shiftwidth=2                             " Indent two spaces
set expandtab                                " Use spaces instead of tabs
set cursorline                               " Highlight current line
set hlsearch                                 " When there is a previous search pattern, highlight all its matches
set incsearch                                " Jump to found words when typing search pattern
set smartcase                                " Search is case insensitive unless you have capital letter in pattern

set colorcolumn=80                           " Show ruler, so it's easier avoiding writing long lines
syntax enable
set spell                                    " Enable spell checker
set noshowmode                               " Airline already shows current mode, no need to repeat
" }}}
" Leader Shortcuts {{{
let mapleader=","                            " value for <leader> variable. Most user-shortcuts start with it

nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :Gstatus<cr>
nnoremap <leader>p :Gpull --rebase <bar> Gpush<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>e :<C-u>NERDTree %<cr>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>a :Ag<cr>
nnoremap <leader>h :<C-u>nohlsearch<cr>      " Stop highlighting search results
nnoremap <leader>c :ALEFix<cr>  " Auto fix code
nnoremap <leader>t :call ToggleBackground()<cr>
function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction
" }}}
" Line Shortcuts {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Navigate split panels with crtl-{hjkl}
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" }}}
"
" vim:foldmethod=marker:foldlevel=0
