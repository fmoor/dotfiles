call plug#begin('~/.vim/plugged')

" configuration for Rust
Plug 'rust-lang/rust.vim'

" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

" tag browser
Plug 'majutsushi/tagbar'

" An Interface to WEB APIs
Plug 'mattn/webapi-vim'

" A dark, low-contrast, Vim colorscheme
Plug 'romainl/Apprentice'

" provides linting hints for ESlint, Flow, etc.
Plug 'w0rp/ale'

call plug#end()

syntax on
color apprentice

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 50

set spelllang=en
set spell
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

