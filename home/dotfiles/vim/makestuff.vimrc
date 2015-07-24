noremap <silent> mm :call RunMake("")<CR>
noremap <silent> mc :call RunMake("clean")<CR>
noremap <silent> mt :call RunMake("test")<CR>
noremap <silent> ml :call RunSplint("-weak")<CR>
noremap <silent> mx :call RunSplint("-strict -strict-lib")<CR>

noremap <silent> mn :cnext<CR>
noremap <silent> mp :cprev<CR>
noremap <silent> mN :lnext<CR>
noremap <silent> mP :lprev<CR>
noremap <silent> mg :cfirst<CR>
noremap <silent> mG :clast<CR>
noremap <silent> mf :lfirst<CR>
noremap <silent> mF :llast<CR>
noremap <silent> m. :botright cwindow<CR>
noremap <silent> m, :cclose<CR>

fu! RunMake(flags)
  exe "make ".a:flags
  exe "botright cwindow"
endfu

fu! RunSplint(flags)
  let makeprg_save = &makeprg
  exe "setlocal makeprg=splint"
  exe "make ".a:flags." %"
  exe "setlocal makeprg=".makeprg_save
  exe "botright cwindow"
endfu
