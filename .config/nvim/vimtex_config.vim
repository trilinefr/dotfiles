let maplocalleader="'"

let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled=1

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers={}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme


" Compiler settings
let g:vimtex_compiler_enabled=1
let g:vimtex_compiler_method='latexmk'
"let g:vimtex_compiler_latexmk=

" Viewer configuration
let g:vimtex_view_general_viewer='zathura'
"let g:vimtex_view_general_options=
let g:vimtex_view_zathura_check_libsynctex=v:true
"let g:vimtex_view_zathura_options=

" Behavior
let g:vimtex_env_change_autofill=0

function! Synctex()
    execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
    redraw!
endfunction
map      <C-enter>        :call Synctex()<cr>

" Mappings
nnoremap lC               <plug>(vimtex-env-change)
nnoremap lc               <plug>(vimtex-cmd-change)
nnoremap lm               <plug>(vimtex-env-change-math)
nnoremap lme              <plug>(vimtex-delim-change-math)

" Use `am` and `im` for the inline math text object
omap     am               <Plug>(vimtex-a$)
xmap     am               <Plug>(vimtex-a$)
omap     im               <Plug>(vimtex-i$)
xmap     im               <Plug>(vimtex-i$)

" Use `ai` and `ii` for the item text object
omap     ai               <Plug>(vimtex-am)
xmap     ai               <Plug>(vimtex-am)
omap     ii               <Plug>(vimtex-im)
xmap     ii               <Plug>(vimtex-im)

" Misc
noremap  <LocalLeader>lf  <plug>(vimtex-cmd-toggle-frac)
nnoremap <LocalLeader>lsc <plug>(vimtex-cmd-toggle-star)
nnoremap <LocalLeader>lse <plug>(vimtex-env-toggle-star)
nnoremap <LocalLeader>lm  <plug>(vimtex-env-toggle-math)
nnoremap <LocalLeader>lsd <plug>(vimtex-delim-toggle-modifier)
nnoremap <LocalLeader>lsD <plug>(vimtex-delim-toggle-modifier-reverse)
nnoremap <LocalLeader>lsi <plug>(vimtex-imaps-list)
nnoremap <LocalLeader>lv  <plug>(vimtex-view)
noremap  <nop>            <plug>(vimtex-toggle-main)

" Imaps mapping, read :h vimtex-imaps for more
let      g:vimtex_imaps_leader=','

