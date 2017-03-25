if filereadable(expand("~/.vim/custom.private.vim"))
  source ~/.vim/custom.private.vim
endif

if filereadable(expand("~/.vim/custom.local.vim"))
  source ~/.vim/custom.local.vim
endif

if filereadable(expand("~/.vim/custom.private.local.vim"))
  source ~/.vim/custom.private.local.vim
endif
