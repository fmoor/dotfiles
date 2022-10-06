let mapleader=";"

" auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'  " comment out lines with gcc
	Plug 'arcticicestudio/nord-vim'  " color scheme
	Plug 'SirVer/ultisnips'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'edgedb/edgedb-vim'
	Plug 'elixir-editors/vim-elixir'
	Plug 'aliou/bats.vim'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'FooSoft/vim-argwrap'
	Plug 'stevearc/vim-arduino'
	Plug 'hashivim/vim-terraform'
	Plug 'rust-lang/rust.vim'
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install --frozen-lockfile --production',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

set autowrite  " save file on certain actions
set autoread  " reload the buffer if the file on disk changed
set cursorline  " highlight the current line
set scrolloff=8  " leave n lines between the cursor and edge of screen
set spell  " enable spell checking
set spelllang=en_us
set relativenumber " Relative line numbers on left.
set number " hybrid mode relative number
set timeoutlen=1000
set ttimeoutlen=10
set hidden " Required for language server operations
set hlsearch " highlight search results
set encoding=utf-8
set directory=~/.vimswap//
set backupdir=~/.vimbackup//
set tabstop=4  " a tab is 2 spaces
set softtabstop=4  " number of spaces to remove on <BS>
set shiftwidth=4  " number of spaces for auto indenting
set expandtab
set sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize"
set updatetime=300

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" not sure this is working :/
autocmd FocusGained,FocusLost,BufEnter,BufLeave * checktime

" may be overridden in ftplugin files
nmap <buffer> <silent> gm <Plug>(coc-menu)
nmap <buffer> <silent> K <Plug>(coc-hover)
nmap <buffer> <silent> gd <Plug>(coc-definition)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> 1gD <Plug>(coc-type-definition)
nmap <buffer> <silent> gr <Plug>(coc-references)
nmap <buffer> <silent> gs <Plug>(coc-symbols)
nmap <buffer> <silent> rn <Plug>(coc-rename)
nmap <buffer> <silent> [d <Plug>(coc-diagnostic-prev)
nmap <buffer> <silent> ]d <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>a :ArgWrap<CR>
nmap <leader>j :SplitjoinJoin<CR>
nmap <leader>s :SplitjoinSplit<CR>
nmap <leader>f <Plug>(coc-format)
imap <C-l> <Plug>(coc-snippets-expand)

" configure vim-terraform
let g:terraform_fmt_on_save = 1

" don't use splitjoin's default mappings
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" add relative line numbers to netrw
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

filetype plugin on

" Nord customization's must come before the colorscheme command
let g:nord_cursor_line_number_background = 1
augroup nord-theme-overrides
  autocmd!

	" make line number offsets brighter
  autocmd ColorScheme nord highlight LineNr ctermfg=5 guifg=#b48ead
augroup END

colorscheme nord

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Customize fzf colors to match Nord
let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'],
	\}

" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
let g:coc_global_extensions = [
	\ 'coc-cmake',
	\ 'coc-css',
	\ 'coc-cssmodules',
	\ 'coc-elixir',
	\ 'coc-esbonio',
	\ 'coc-git',
	\ 'coc-go',
	\ 'coc-highlight',
	\ 'coc-html',
	\ 'coc-htmlhint',
	\ 'coc-json',
	\ 'coc-markdownlint',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-rust-analyzer',
	\ 'coc-sh',
	\ 'coc-snippets',
	\ 'coc-sql',
	\ 'coc-stylelint',
	\ 'coc-stylelintplus',
	\ 'coc-svelte',
	\ 'coc-toml',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-xml',
	\ 'coc-yaml',
	\ ]

" keep this at the end of this file
set exrc  " allow reading .vimrc file in current directory
set secure  " disable unsafe cmds from .vimrc in current directory
