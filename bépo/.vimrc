""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bdls')

Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'

call plug#end()

" Pour permettre la recherche dans un PDF directement avec vimtex
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" Intégration de YouCompleteMe
 if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

 " Configuration de vim-surround pour vimtex
augroup latexSurround
     autocmd!
     autocmd FileType tex call s:latexSurround()
  augroup END

  function! s:latexSurround()
     let b:surround_{char2nr("e")}
       \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
     let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
  endfunction

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
" Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
noremap w <C-w>
noremap W <C-w><C-w>
 
" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk
 
" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédent / suivant
noremap gb gT
noremap gé gt
" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
noremap gB :exe "silent! tabfirst"<CR>
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

" Raccourcis personnalisés
let      mapleader = "'"
let      localmapleader = "'"
noremap  à `
noremap  àà ``
nnoremap <leader>q :wq<CR>
nnoremap <leader><leader> :w<CR>
inoremap <leader>u <ESC>u
noremap  <leader>r :w<CR>:source   $HOME/.vimrc<CR>
noremap  "" <Plug>Ysurround aé>$a
noremap  <leader>l :!pdflatex %:p <CR>

" Rendre les touches fléchées ineffectives
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Misc
inoremap qq <ESC>
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Plugins configuration                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""
"   UltiSnips  "
""""""""""""""""
let g:UltiSnipsExpandTrigger       = "<CR>"
let g:UltiSnipsJumpForwardTrigger  = "<CR>"
let g:UltiSnipsJumpBackwardTrigger = "<s-CR>"  
let g:UltiSnipsListSnippets        = "<c-tab>"


""""""""""""""""""
"  vim-surround  "
""""""""""""""""""
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap ls  <Plug>Csurround
nmap lS  <Plug>CSurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

""""""""""""
"  VimTex  "
""""""""""""
nmap <leader>de <plug>(vimtex-env-delete)
nmap <leader>dc <plug>(vimtex-cmd-delete)
nmap <leader>d$ <plug>(vimtex-env-delete-math)
nmap <leader>ce <plug>(vimtex-env-change)
nmap <leader>cc <plug>(vimtex-cmd-change)
nmap <leader>o  <plug>(vimtex-cmd-toggle-frac)
xmap <leader>o  <plug>(vimtex-cmd-toggle-frac)
nmap <leader>cs <plug>(vimtex-cmd-toggle-star)
nmap <leader>es <plug>(vimtex-env-toggle-star)
nmap <leader>ld <plug>(vimtex-delim-toggle-modifier)
nmap <leader>lD <plug>(vimtex-delim-toggle-modifier-reverse)
nmap <leader>cd <plug>(vimtex-delim-change-math)
nmap <leader>c$ <plug>(vimtex-env-change-math)
imap cd         <plug>(vimtex-delim-close)

""""""""""""""""""""
"  Vim Easy Align  "
""""""""""""""""""""
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

"""""""""""""""""""""
"  You Complete Me  "
"""""""""""""""""""""
 " let g:ycm_key_list_select_completion   =[ '<s-t>']
 " let g:ycm_key_list_previous_completion =[ '<s-s>']
 " let g:ycm_key_list_stop_completion     =[ '<esc>']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Behavior                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set nobackup
set undofile
set nocompatible

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=3
set autoindent
set backspace=indent,eol,start

set wrap linebreak
set scrolloff=10

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
set wildmode=list:longest

set display=truncate

set relativenumber
set cursorline
set laststatus=2

filetype plugin indent on
syntax on
let c_comment_strings=1

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

""""""""""""
" Search  "
""""""""""""
set ic
set smartcase
set incsearch
set gdefault
set showmatch
set hlsearch
