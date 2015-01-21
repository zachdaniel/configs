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

Plugin 'gmarik/Vundle.vim'
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
Plugin 'chriskempson/base16-vim'
Plugin 'nixon/vim-vmath'
Plugin 'gavinbeatty/dragvisuals.vim'

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
"Change
"########
" Colors
"#######
syntax enable

set background=dark
colorscheme base16-railscasts

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
" Basic editor Functions
"########

" Default tab behavior
set tabstop=4 shiftwidth=4 expandtab

"Making backspace work right
set backspace=indent,eol,start

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" Enable code folding by default, on indentation

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default


" Make searching work correctly
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=red ctermbg=white
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 350) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" Make whitespace characters shown as weird chars
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

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

"#########
" Vim Math
" ########
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

"#########
" Drag Visuals
"#########

vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')

" Remove any introduced trailing whitespace after moving... 
let g:DVB_TrimWS = 1

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
