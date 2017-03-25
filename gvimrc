" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Private config
if filereadable($HOME . "/.gvimrc.private")
  source ~/.gvimrc.private
endif

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" Private local config
if filereadable($HOME . "/.gvimrc.private.local")
  source ~/.gvimrc.private.local
endif
