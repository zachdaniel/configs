filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-surround'

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

" Undo and Backup options
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set backupdir=~/.vim/backups,.
set directory=~/.vim/backups,.
set hidden

" Line Numbers
:set nu

" Color scheme options
" Solarized is set up through Iterm Preferences
syntax enable
colorscheme solarized

"" NERDtree options
" Binds opening NERDtree to ctrl + n
map <C-n> :NERDTreeToggle<CR>

" This has nerdtree not close on file open by default
let NERDTreeQuitOnOpen = 0

let hostfile='~/Configs/vimrc-' . hostname()
if filereadable(hostfile)
    exe 'source ' . hostfile
endif
