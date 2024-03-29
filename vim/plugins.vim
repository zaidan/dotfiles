" vim:fdm=marker

" Setup Plugin Support {{{
filetype off  " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Languages
Plugin 'sheerun/vim-polyglot'

" Ruby
Plugin 'skwp/vim-rspec'
Plugin 'ruby.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
"Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'killphi/vim-ruby-refactoring'
Plugin 'ngmy/vim-rubocop'
" Rubyblocs
"Plugin 'ruby-matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
"Plugin 'w0113/vim-textobj-rubyblock'

"Plugin 'skalnik/vim-vroom'
Plugin 'splitjoin.vim'
"Plugin 'rson/vim-conque'
"Plugin 'skwp/vim-ruby-conque'

" Templates
Plugin 'slim-template/vim-slim.git'

" SCSS
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'

" JavaScript
Plugin 'styled-components/vim-styled-components'
"Plugin 'yuezk/vim-js'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'leafgarland/typescript-vim'
Plugin 'jparise/vim-graphql'

" C
"Plugin 'c.vim'

" GDB
"Plugin 'Conque-GDB'
Plugin 'bubuntux/Conque-GDB.git'

" Coffee Script
Plugin 'vim-coffee-script'

" CSV
"Plugin 'csv.vim'

" LaTeX
Plugin 'vim-latex/vim-latex'

" General Editing

Plugin 'AnsiEsc.vim'

" Auto complete
Plugin 'ervandew/supertab'

" Align regions of text that match a pattern
Plugin 'tabular'

" Comments
Plugin 'The-NERD-Commenter'

" Unicode - Insert special unicode chars
Plugin 'unicode.vim'

" Utils
" Git
Plugin 'fugitive.vim'
" Files
Plugin 'scrooloose/nerdtree'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
" Add gitignored files to wildignore
Plugin 'octref/RootIgnore'

" Todo List
"Plugin 'vim-orgmode'
"Plugin 'speeddating.vim'

" Security
Plugin 'SudoEdit.vim'

" Elm
Plugin 'lambdatoast/elm.vim'
"Plugin 'elmcast/elm-vim'

" Openscad
"Plugin 'sirtaj/vim-openscad'
Plugin 'oysteinkrog/vim-openscad'

" Colors
Plugin 'Wombat'
call vundle#end()

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" filetype plugin indent on
" Revert with ":filetype off".
filetype indent plugin on

" }}}

" Plugin configuration {{{

" vim-latex {{{

" Fix filetype detection for empty .tex files
" http://vim-latex.sourceforge.net/faq.shtml#faq-not-loaded-vim7
let g:tex_flavor = "latex"

" }}}

" Wombat {{{

" Set color scheme
colorscheme wombat

" }}}


" RootIgnore {{{

" Let RootIgnore set ctrlp's g:ctrlp_user_command to use ag for faster search.
let g:RootIgnoreAgignore = 1

" }}}

" CtrlP {{{

" Ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" }}}

" NERDTree {{{

" Mouse click in NERDTree
" use :set mouse
let g:NERDTreeMouseMode=3

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}

" Javascript/CSS {{{

let g:jsx_ext_required = 0 " Works on files other than .jsx

if has('autocmd')
  " Support `-` in css property names
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  call jspretmpl#register_tag('gql', 'graphql')
  autocmd FileType javascript.jsx JsPreTmpl
  autocmd FileType javascript JsPreTmpl
endif

"let g:vim_jsx_pretty_colorful_config = 1

" }}}

" }}}

" Include {{{
if filereadable(expand("~/.vim/plugins.private.vim"))
  source ~/.vim/plugins.private.vim
endif

if filereadable(expand("~/.vim/plugins.local.vim"))
  source ~/.vim/plugins.local.vim
endif

if filereadable(expand("~/.vim/plugins.private.local.vim"))
  source ~/.vim/plugins.private.local.vim
endif
" }}}
