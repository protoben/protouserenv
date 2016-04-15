let s:line_comment_leaders = { "c":       "//",
                             \ "cpp":     "//",
                             \ "java":    "//",
                             \ "sh":      "#",
                             \ "erlang":  "%",
                             \ "tex":     "%",
                             \ "vim":     '\"',
                             \ "haskell": "--"}

fu! ToggleLineComment()
  if has_key(s:line_comment_leaders, &filetype)
    let leader = s:line_comment_leaders[&filetype]
  else
    let leader = "// "
  endif

  if getline(".") =~ "^" . "[ \t]*" . leader
    execute "silent s/^\\([ \\t]*\\)" . escape(leader, "\/") . "\\([ \\t]*\\)/\\1\\2"
  else
    execute "silent s/^\\([ \\t]*\\)/" . escape(leader, "\/") . "\\1"
  endif
endfu

noremap <silent> \\ :call ToggleLineComment()<CR>
