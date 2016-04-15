set noexpandtab
set tabstop=8
set shiftwidth=8
set smartindent
set nocindent

augroup gofmt
  autocmd!
  autocmd BufWritePost,FileWritePost *.go execute '!go fmt %'
augroup END
