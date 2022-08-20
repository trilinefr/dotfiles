" Map leader
let mapleader      = ","

" Plugins
let data_dir = "$XDG_CONFIG_HOME/nvim"
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-easy-align'
nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

Plug 'tpope/vim-surround'
let  g:surround_no_mappings=1 " Interdire au plugin de faire les mappings par défaut
" Normal mode
nmap ds      <Plug>Dsurround
nmap ycs     <Plug>Csurround
nmap ycS     <Plug>CSurround
nmap ys      <Plug>Ysurround
nmap yS      <Plug>YSurround
nmap yss     <Plug>Yssurround
nmap ySs     <Plug>YSsurround
nmap ySS     <Plug>YSsurround
" Visual mode
xmap ys      <Plug>VSurround
xmap gS      <Plug>VgSurround
" Insert mode 
imap <C-s>   <plug>Isurround
imap <C-S-s> <Plug>ISurround

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-fugitive'

Plug 'tommcdo/vim-exchange'
let  g:exchange_no_mappings=1
nmap <leader>x  <Plug>(Exchange)
nmap <leader>X  <Plug>(ExchangeLine)
xmap <leader>x  <Plug>(Exchange)
nmap <leader>xc <Plug>(ExchangeClear)

Plug 'tpope/vim-abolish'
let g:abolish_no_mappings=1
nmap <leader>co <Plug>(abolish-coerce-word)

Plug 'lervag/vimtex'
runtime vimtex_config.vim

Plug 'ycm-core/YouCompleteMe'
runtime ycm_config.vim

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = '<Space><Space>'
let g:UltiSnipsJumpForwardTrigger  = '<Space><Space>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Space><S-Space>'
let g:UltiSnipsListSnippets        = '<C-Space>' 
let g:UltiSnipsEditSplit           = 'context'
let g:UltiSnipsSnippetDirectories  = ["UltiSnips"] " Liste de dossiers où chercher les snippets, valeur par défaut ici, voir :h UltiSnips-how-snippets-are-loaded

Plug 'honza/vim-snippets'

Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme torte

if $XDG_SESSION_TYPE==?"WAYLAND"
    au BufWritePost ~/.config/sway/config !swaymsg reload
    au BufWritePost ~/.config/waybar/config !swaymsg reload
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Behavior                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%
"
" Format the status line
" http://archive09.linux.com/feature/120126
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\
"    [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Column:\ %v\ %p%%

set encoding=utf-8

set matchpairs+=":",':'

set nobackup
set undofile
set nocompatible

set tabstop     =4
set shiftwidth  =4
set softtabstop =4
set expandtab
set autoindent
set backspace   =eol,start,indent

set wrap linebreak
set scrolloff=10

set history  =200 " keep 200 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set wildmenu    " display completion matches in a status line
set wildmode =longest:full

set display=truncate

set relativenumber
set number
set cursorline
set laststatus=2

set mousefocus
set mouse=a

filetype plugin indent on
syntax on
let c_comment_strings=1

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

""""""""""""
" Search   "
""""""""""""
set ic
set smartcase
set incsearch
set gdefault
set showmatch
set hlsearch
