let maplocalleader="'"

let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexrun'
let g:vimtex_fold_enabled=1



" Mappings
nnoremap lse              <plug>(vimtex-env-change)
nnoremap lsc              <plug>(vimtex-cmd-change)
nnoremap ls$              <plug>(vimtex-env-change-math)
nnoremap lsd              <plug>(vimtex-delim-change-math)
noremap  <LocalLeader>lf  <plug>(vimtex-cmd-toggle-frac)
nnoremap <LocalLeader>lsc <plug>(vimtex-cmd-toggle-star)
nnoremap <LocalLeader>lse <plug>(vimtex-env-toggle-star)
nnoremap <LocalLeader>lm  <plug>(vimtex-env-toggle-math)
nnoremap <LocalLeader>lsd <plug>(vimtex-delim-toggle-modifier)
nnoremap <LocalLeader>lsD <plug>(vimtex-delim-toggle-modifier-reverse)
nnoremap <LocalLeader>lsi <plug>(vimtex-
noremap  <nop>            <plug>(vimtex-toggle-main)
