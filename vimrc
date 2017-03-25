set nocompatible
" Leader
let mapleader = ","

" Load _vimrc, .vimrc or _exrc files in current directory
"set exrc

" Backup files
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

source ~/.vim/general.vim
source ~/.vim/bindings.vim
source ~/.vim/custom.vim
source ~/.vim/plugins.vim

" Private config
if filereadable($HOME . "/.vimrc.private")
  source ~/.vimrc.private
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Private local config
if filereadable($HOME . "/.vimrc.private.local")
  source ~/.vimrc.private.local
endif
