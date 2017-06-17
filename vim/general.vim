" Load _vimrc, .vimrc or _exrc files in current directory
set exrc

" Backup files
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" Encoding
set encoding=utf-8

" vim-latex

" Fix filetype detection for empty .tex files
" http://vim-latex.sourceforge.net/faq.shtml#faq-not-loaded-vim7
let g:tex_flavor = "latex"

" Set :grep command and format
" set grepprg=grep\ -nH\ $*
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" Activate Vim's build-in matchit macros. Makes the % command work better.
" Use runtime here to support neovim
if !has('nvim')
  packadd! matchit
endif

" When editing a file that is already edited with another Vim instance, go to
" that Vim instance
if !has('nvim')
  packadd! editexisting
endif

" justifying text.
packadd! justify

" Menus for editing shell scripts in the GUI version
packadd! shellmenu

" Set cpoptions to aABceEFs$
" E: It is an error when using "y", "d", "c", "g~", "gu" or "gU" on
"    an Empty region.
" 
" $: When making a change to one line, don't redisplay the line, but
"    put a '$' at the end of the changed text.
set cpoptions+=E$

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Keep 10000 lines of command line history
set history=10000		

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Display completion matches in a status line
set wildmenu

set wildmode=list:longest,list:full

set wildignore+=*.o,*.obj,.git

" Add support for environment variables using curly braces.
" Allows gf command to recognize paths like ${FOO}/bar/file.
set isfname+={,}

" Only wrap at a character in the breakat option 
set linebreak

" No line wrap
set nowrap

" Strings to use in 'list' mode and for the :list command.
" Display each tab as '>-'
set listchars+=tab:>-,trail:·,nbsp:·

" When a bracket is inserted, briefly jump to the matching one.
" The jump is only done if the match can be seen on the screen.
set showmatch

" Tenths of a second to show the matching paren, when 'showmatch' is set.
" Note that this is not in milliseconds, like other options that set a time.
set matchtime=1

" The minimal number of columns to scroll horizontally.
set sidescroll=1

" Splitting a window will put the new window below the current.
set splitbelow

" Copy indent from current line when starting a new line (typing <CR> in
" Insert mode or when using the "o" or "O" command).  If you do not type
" anything on the new line except <BS> or CTRL-D and then type <Esc>, CTRL-O
" or <CR>, the indent is deleted again.  Moving the cursor to another line has
" the same effect, unless the 'I' flag is included in 'cpoptions'.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" do not keep a backup file, use versions instead
set nobackup

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Activate relative line numbering
set relativenumber

" Time out on key codes, not on mappings, see :help ttimeout
set notimeout

" Time out for key codes
set ttimeout

" Tabstops
"     tabstop: Number of spaces that a <Tab> in the file counts for.
"  shiftwidth: Number of spaces to use for each step of (auto)indent.
" softtabstop: Number of spaces that a <Tab> counts for while performing
"              editing operations, like inserting a <Tab> or using <BS>.
set tabstop=2 shiftwidth=2 softtabstop=2

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands and when
" 'autoindent' is on. To insert a real tab when 'expandtab' is on, use
" CTRL-V<Tab>.
set expandtab

" Paste between vim instances
set clipboard=unnamedplus

" Disable size and line limits for buffers
" ': Maximum number of previously edited files for which the marks are remembered.
" <: Maximum number of lines saved for each register.  If zero then registers are not saved.
"    When not included, all lines are saved.
" s: Maximum size of an item in Kbyte.
" h: Disable the effect of 'hlsearch' when loading the viminfo file. (default)
set viminfo='10000,s10000,h

" ctags
set tags+=gems.tags

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" See :help mouse
if has('mouse')
  " set mouse=a
endif

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
" set scrolloff=5

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" print to ps
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " Switch on highlighting the last used search pattern.
  set hlsearch

  " Switch on highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Autocmd {{{
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on
  " Revert with ":filetype off".
  filetype indent plugin on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimrc | au! | augroup END"
  augroup vimrc
    " clear group
    autocmd!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
else
  " always set autoindenting on
  set autoindent                
endif
" }}}

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" Spelling
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *.tex     setlocal spell    spelllang=en_us,de_de

if filereadable(expand("~/.vim/general.private.vim"))
  source ~/.vim/general.private.vim
endif

if filereadable(expand("~/.vim/general.local.vim"))
  source ~/.vim/general.local.vim
endif

if filereadable(expand("~/.vim/general.private.local.vim"))
  source ~/.vim/general.private.local.vim
endif
