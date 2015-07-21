" ╻ ╻╻┏┳┓╺┳╸┏━╸┏┳┓┏━┓╻  ┏━┓╺┳╸┏━╸┏━┓
" ┃┏┛┃┃┃┃ ┃ ┣╸ ┃┃┃┣━┛┃  ┣━┫ ┃ ┣╸ ┗━┓
" ┗┛ ╹╹ ╹ ╹ ┗━╸╹ ╹╹  ┗━╸╹ ╹ ╹ ┗━╸┗━┛


" Try to find templates script for all file types
au BufNewFile * exec MakeTemplate()
fu! MakeTemplate()
  let dirlist = split(getcwd() . "/dummy", '/')

  while len(dirlist) > 0
    let dirlist = dirlist[:-2]
    let dir = '/' . join(dirlist + ['.vimtemplates'], '/')
    if isdirectory(dir)
      break
    else
      unlet dir
    endif
  endwhile

  if !exists('dir')
    return
  endif

  let template = dir . '/template*.' . &filetype . '.*sh'
  let template = split(expand(template), '\n')[0]

  if executable(template)
    call append(0, systemlist(template . ' ' . dir . ' ' . expand('%')))
    return
  endif

  let template = dir . '/template.sh'

  if executable(template)
    call append(0, systemlist(template . ' ' . dir . ' ' . expand('%')))
    return
  endif
endfu
