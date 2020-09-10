call plug#begin('~/.vim/plugged')

" go config
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" javascript
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

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
set scrolloff=999
set autowrite
set nobackup
set nowritebackup

" remove delay after typing Shift-o (insert line above) 
" https://github.com/vim/vim/issues/24#issuecomment-132350171
:set timeout timeoutlen=5000 ttimeoutlen=100

" golang
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd FileType xml setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType xslt setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType elixir setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType eelixir setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

" javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 noexpandtab
