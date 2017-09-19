set shell=/bin/bash

set nocompatible			" be iMproved
set backspace=2				" Make backspace work
filetype off				" Vundle needs this
let mapleader=","			" value for <leader> variable. Most user-shortcuts start with it

set rtp+=/usr/local/opt/fzf		" If fzf installed using Homebrew
set rtp+=~/.vim/bundle/Vundle.vim	" Vundle installed using git checkout

" Vundle plugins 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'		" Git - the stupid content tracker, add support of git status, git blame and stuff
Plugin 'vim-airline/vim-airline'	" Nice status bar with bells and whistles
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'		" Git diff in the gutter (next to line numbers)
Plugin 'scrooloose/syntastic'		" Syntax check, linters and stuff
Plugin 'scrooloose/nerdtree'		" Fancy file tree browser
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Show Git status in Nerdtree
Plugin 'junegunn/fzf'			" Fuzzy file name search
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on		" Required by Vundle

" Files navigation
nnoremap <leader>f :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>e :<C-u>NERDTree %<cr>

" this output doesn't include symlinks, so less duplicates in output
let $FZF_DEFAULT_COMMAND = 'find . -type f | grep -v ".git"'

" Plugin configuration 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntax checker settings
let g:syntastic_mode_map = {"mode": "active"}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntax check for Perl
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
set iskeyword-=:			" Don't treat Foo::Bar as a single word

" Fancy colors
set t_Co=256
colorscheme molokai
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" Editor layout settings
set laststatus=2			" Always show the status line (bottom of the screen)
set listchars=tab:>-,trail:.		" Show all tabs and trailing spaces
set list
set number				" Show line numbers.
set hlsearch				" When there is a previous search pattern, highlight all its matches
set incsearch				" Jump to found words when typing search pattern
set smartcase				" Search is case insensitive unless you have capital letter in pattern
nnoremap <leader>h :<C-u>nohlsearch<cr>	" Stop highlighting search results

" set colorcolumn=80			" Show ruler, so it's easier avoiding writing long lines
syntax enable
set spell				" Enable spell checker
set noshowmode				" Airline already shows current mode, no need to repeat

set visualbell
set noerrorbells			" Don't beep.

" Navigate split panels with crtl-{hjkl}
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" close when NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Some more key bindings
map <C-n> :NERDTree<CR>
map <C-c> :SyntasticCheck<CR>
