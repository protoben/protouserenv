set foldenable
set foldmethod=syntax

" C wordlist
au BufNewFile,BufRead *.c,*.h
   \ set complete=.,i,k~/.vim/wordlists/c-keywords.list

" View manpages in split
runtime ftplugin/man.vim
nnoremap <silent>K :<C-U>exe "Man" v:count "<cword>"<CR>
vmap <silent>K y :<C-U>exe "Man" v:count "<C-R>""<CR>

let g:syntastic_auto_jump = 0
