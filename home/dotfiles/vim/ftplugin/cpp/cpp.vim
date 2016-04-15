set foldenable
set foldmethod=syntax

" C++ wordlist
au BufNewFile,BufRead *.cpp,*.hpp
   \ set complete=.,i,k~/.vim/wordlists/cpp-keywords.list

let g:syntastic_auto_jump = 0
let syntastic_cpp_config_file='./.syntastic.conf'
