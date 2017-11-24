" Preamble {{{
execute pathogen#infect()
" }}}

" TTY Performance {{{
set nocompatible
set synmaxcol=300
set ttyfast
set lazyredraw
" }}}

" map*leader {{{
let mapleader=" "
let maplocalleader="\\"
" }}}

" NeoVim {{{
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Neovim takes a different approach to initializing the GUI. As It seems some
  " Syntax and FileType autocmds don't get run all for the first file specified
  " on the command line.  hack sidesteps that and makes sure we get a chance to
  " get started. See https://github.com/neovim/neovim/issues/2953
  augroup nvim
    au!
    au VimEnter * doautoa Syntax,FileType
  augroup END
endif
" }}}

" Syntax Highlighting {{{
syntax on
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans
filetype plugin indent on
" }}}

" UI {{{
set number
" }}}

" Text editing {{{
set autoindent
" }}}

" Whitespace handling {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:»·,trail:·

autocmd BufWritePre * %s/\s\+$//e
" }}}

" Makefile {{{
augroup makefile
  au!
  au FileType make set noexpandtab
augroup END
" }}}

" Go {{{
augroup golang
  au!
  au BufNewFile,BufRead *.go set nolist
  au Filetype go set makeprg=go\ build\ ./...
augroup END

set rtp+=~/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" }}}

" Lightline {{{
let g:lightline = {
  \ 'colorscheme': 'jellybeans'
  \ }
" }}}

" FZF {{{
set rtp+=/usr/local/opt/fzf
" }}}

" Keyboard shortcuts {{{
nnoremap <leader>j :Buffers<cr>
nnoremap <leader>p :Files<cr>
nnoremap <leader>t :TagbarToggle<cr>
noremap H ^
noremap L $
" }}}
