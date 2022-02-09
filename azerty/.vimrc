" Réglages généraux
set showcmd
set relativenumber
set hlsearch
set number
set wildmenu

syntax enable
filetype plugin indent on

" Mappings personnalisés
   " Normal mode
let mapleader=','
let maplocalleader=',' 

nnoremap <leader><leader> :w<CR>
nnoremap <leader>q        :wq<CR>
nnoremap <leader><CR>     :vs<CR>:edit
nnoremap <leader><space>  :sp<CR>:edit
nnoremap <leader>cc       :vs<CR>:edit  $MYVIMRC<CR>
nnoremap <leader>r        :w<CR>:source $MYVIMRC<CR>
nnoremap <leader>ww       <c-w><c-w>
nnoremap <leader>wh       <c-w><c-h>
nnoremap <leader>wj       <c-w><c-j>
nnoremap <leader>wk       <c-w><c-k>
nnoremap <leader>wl       <c-w><c-l>
nnoremap <leader>n        :NERDTreeFocus<CR>
nnoremap <C-t>            :NERDTree<CR>
nnoremap <leader>;        :NERDTreeToggle<CR>
nnoremap <C-f>            :NERDTreeFind<CR>
nmap     <leader>a        <Plug>(EasyAlign)
xmap     <leader>a        <Plug>(EasyAlign)
nnoremap <leader>n        :let  @/ = ""<CR>

   " Insert mode (mostly autocomplete junk)
inoremap ,, <esc>
inoremap "  ""<left>
inoremap (  ()<left>
inoremap {  {}<left>
inoremap [  []<left>
inoremap '  ''<left>
inoremap jj <right>
inoremap <  <><left>



 " Télécharger et mettre à jour automatiquement plug.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

 Plug 'scrooloose/nerdtree'
 Plug 'junegunn/vim-easy-align'
 Plug 'rdnetto/YCM-Generator'
 Plug 'lervag/vimtex'
let g:tex_flavor           = 'latex'
let g:vimtex_view_method   = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel           = 1
let g:tex_conceal          = 'abdmg'
Plug 'ycm-core/YouCompleteMe' 
let g:ycm_key_list_select_completion   = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:ycm_key_list_stop_completion     = ['<Esc>']
let g:ycm_key_invoke_completion        = ''
 Plug 'tpope/vim-surround'
 Plug 'honza/vim-snippets'
 Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger       = '<CR>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories  = ["UltiSnips", "~/.vim/personnalized_snippets/"]

call plug#end()

" Intégration de YouCompleteMe
 if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

  
