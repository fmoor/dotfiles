call plug#begin('~/.vim/plugged')

" configuration for Rust
Plug 'rust-lang/rust.vim'

Plug 'elixir-editors/vim-elixir'

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

" yaml
Plug 'stephpy/vim-yaml'

call plug#end()

syntax on
:filetype on
color apprentice

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 50

set spelllang=en
set spell

autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType elixir setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType eelixir setlocal ts=2 sts=2 sw=2 expandtab
