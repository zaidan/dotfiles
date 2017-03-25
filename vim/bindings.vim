" Leader
let mapleader = ","

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Line numbering
noremap <leader>nr :set invrelativenumber<cr>
noremap <leader>nu :set invnu<cr>

" Ruby refactoring
nnoremap <leader><leader>ap  :RAddParameter<cr>
nnoremap <leader><leader>cp :RConvertPostConditional<cr>
nnoremap <leader><leader>let  :RExtractLet<cr>
vnoremap <leader><leader>ec  :RExtractConstant<cr>
vnoremap <leader><leader>el :RExtractLocalVariable<cr>
nnoremap <leader><leader>it  :RInlineTemp<cr>
vnoremap <leader><leader>l :RRenameLocalVariable<cr>
vnoremap <leader><leader>i :RRenameInstanceVariable<cr>
vnoremap <leader><leader>em  :RExtractMethod<cr>

" Indent Ruby Hashs with \iv
function IndentV()
  Tabularize /^[^:]*\zs:/r1c0l0
  Tabularize /^[^=>]*\zs=>/r1
  "Tabularize /^[^{]*\zs{/r1
  Tabularize /^[^}]*\zs}>/l1
endfunction
map <Leader>iv :call IndentV()<cr>

" Ruby refactoring
nnoremap <leader><leader>ap  :RAddParameter<cr>
nnoremap <leader><leader>cp :RConvertPostConditional<cr>
nnoremap <leader><leader>let  :RExtractLet<cr>
vnoremap <leader><leader>ec  :RExtractConstant<cr>
vnoremap <leader><leader>el :RExtractLocalVariable<cr>
nnoremap <leader><leader>it  :RInlineTemp<cr>
vnoremap <leader><leader>l :RRenameLocalVariable<cr>
vnoremap <leader><leader>i :RRenameInstanceVariable<cr>
vnoremap <leader><leader>em  :RExtractMethod<cr>

" Convert one line Haskell comment to Elm comment
nnoremap <leader>he cf {-<esc>o<esc>0c$-}<esc>^k
nnoremap <leader>eh cf--- <esc>jddk

" Split navigation
nnoremap <C-h> <C-w><left>
nnoremap <C-j> <C-w><down>
nnoremap <C-k> <C-w><up>
nnoremap <C-l> <C-w><right>

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

if filereadable(expand("~/.vim/bindings.private.vim"))
  source ~/.vim/bindings.private.vim
endif

if filereadable(expand("~/.vim/bindings.local.vim"))
  source ~/.vim/bindings.local.vim
endif

if filereadable(expand("~/.vim/bindings.private.local.vim"))
  source ~/.vim/bindings.private.local.vim
endif
