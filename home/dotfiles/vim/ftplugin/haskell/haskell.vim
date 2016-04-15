" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

" Hdevtools for everything!
let syntastic_haskell_checkers = ['hdevtools']
nnoremap <buffer> KK :GhcModType<CR>
nnoremap <buffer> KI :HdevtoolsInfo<CR>
nnoremap <buffer> KL :GhcModTypeClear<CR>

" Type under cursor in statusline
"function! UserStatusCmd()
"  let l:path = expand('%')
"  if empty(l:path)
"    return ' Cannot get file path'
"  endif
"
"  let l:types = ghcmod#type(line('.'), col('.'), l:path)
"  if empty(l:types)
"    return ' Cannot guess type'
"  endif
"
"  return ' ' . l:types.type()
"endfunction
