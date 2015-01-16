"################
" Bundler
"################

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
:"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Bundle "myusuf3/numbers.vim"
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"########
" Colors
"#######
syntax enable

syntax on
color Dracula

"#########
" Undo and Backup
"########

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/backups,.
set directory=~/.vim/backups,.
set hidden


"########
" Basic Editor Functions
"########

" Default tab behavior
set tabstop=4 shiftwidth=4 expandtab

"Making backspace work right
set backspace=indent,eol,start

"Make up and down behave as expected when lines are wrapped
:nmap j gj
:nmap k gk

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" Enable code folding by default, on indentation

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

"###########
" Colors
"###########

" Solarized is set up through Iterm Preferences
syntax enable

"###########
" Airline
"###########

set laststatus=2

"##########
" NERDtree
"##########

" Binds opening to ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Won't close on file open by default
let NERDTreeQuitOnOpen = 0

" Closes vim if the only window left open is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"##########
" GitGutter
"##########

" Make GitGutter work
hi clear SignColumn

"##########
" Syntastic
"#########

" These are all the recommended defaults, and have NOT been reviewed
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"##########
" Ctrl P
"##########

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

"#########
"Line Numbers
"#########
" set numbers by default
:set nu
"The rest is handled by numbers.vim 

"##########
" Ruby
"##########

"Tabs
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
