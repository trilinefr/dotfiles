" Map leader
let mapleader      = "'"

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
nmap ls     <Plug>Csurround
nmap lS     <Plug>CSurround
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
let  g:UltiSnipsExpandTrigger                           = '<Space><Space>'
let  g:UltiSnipsJumpForwardTrigger                      = '<Space><Space>'
let  g:UltiSnipsJumpBackwardTrigger                     = '<S-Space><S-Space>'
let  g:UltiSnipsListSnippets                            = '<C-Space>'
let  g:UltiSnipsEditSplit                               = 'context'
let  g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '~/.config/nvim/custom_snippets/'
let  g:UltiSnipsSnippetDirectories                      = ["UltiSnips", "custom_snippets"] " Liste de dossiers où chercher les snippets, valeur par défaut ici, voir :h UltiSnips-how-snippets-are-loaded

Plug 'honza/vim-snippets'

Plug 'junegunn/fzf.vim'
inoremap 's <ESC>:Snippets<CR>

call plug#end()

colorscheme torte

if     $XDG_SESSION_TYPE==?"WAYLAND"
    au BufWritePost ~/.config/sway/config   !swaymsg reload
    au BufWritePost ~/.config/waybar/config !swaymsg reload
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    BÉPO configuration & misc remapping                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
onoremap aé aw
onoremap aÉ aW
onoremap ié iw
onoremap iÉ iW
vnoremap aé aw
vnoremap aÉ aW
vnoremap ié iw
vnoremap iÉ iW
" pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <c-w>
noremap W <c-w><c-w>
 
" [hjkl] -> {ctsr}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {cr} = « haut / bas de l'écran »
noremap c h
noremap r l
" {ts} = « joindre / aide »
noremap T J
noremap S K
" corollaire : repli (fold) suivant / précédent
noremap zs zj
noremap zt zk
 
" {hjkl} <- [ctsr]
" ————————————————
" {j} = « jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {l} = « change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {h} = « remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
" {k} = « substitue »          (k = caractère, K = ligne)
noremap k s
noremap k s
" corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédent / suivant
noremap gb gt
noremap gé gt
" optionnel : {gb} / {gé} pour aller au premier / dernier onglet
noremap gb :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0 
" <> en direct
" ————————————
noremap « <
noremap » >
 
" Remaper la gestion des fenêtres
" ———————————————————————————————
noremap wt       <C-w>j
noremap ws       <C-w>k
noremap wc       <C-w>h
noremap wr       <C-w>l
noremap wd       <C-w>c
noremap wo       <C-w>s
noremap wp       <C-w>o
noremap w<SPACE> :split<CR><C-w><C-w>:e
noremap w<CR>    :vsplit<CR><C-w><C-w>:e

" Tags
" ____
noremap <c-)> <c-]>

" Raccourcis personnalisés (dernière ligne : espace insécable)
noremap  à                `
noremap  àà               ``
nnoremap <leader>q        :wq<CR>
nnoremap <leader><leader> :w<CR>
noremap  <leader>r        :w<CR>:source $MYVIMRC<CR>
noremap  <space>          f
noremap                   F

" Misc
inoremap qq              <ESC>
nnoremap <leader><space> :noh<CR>
"nnoremap <tab>           %
"vnoremap <tab>           %

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

set tabstop     = 4
set shiftwidth  = 4
set softtabstop = 4
set expandtab
set autoindent
set backspace   = eol,start,indent

set wrap linebreak
set scrolloff   = 10

set history     = 200 " keep 200 lines of command line history
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set wildmenu          " display completion matches in a status line
set wildmode    = longest:full

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
let g:markdown_folding=1
au FileType markdown setlocal foldlevel=1

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
