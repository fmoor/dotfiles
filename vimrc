" ~/.vimrc

""""""""""""""""""""""""
""" vim-plug section """
""""""""""""""""""""""""

" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" automatically install;
" jedi used by maralla/completor.vim
" linters used by dense-analysis/ale
if empty(glob('~/.vim/venv/bin/python'))
	silent !$__LATEST_PYTHON__ -m venv ~/.vim/venv
	silent !~/.vim/venv/bin/pip install --upgrade pip setuptools
	silent !~/.vim/venv/bin/pip install jedi flake8 mypy
endif


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
"
	" fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" golang support
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	let g:go_fmt_command = "gopls"  " fix https://github.com/fatih/vim-go/issues/502
	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	autocmd FileType go setlocal foldmethod=syntax

	" A collection of language packs for Vim
	Plug 'sheerun/vim-polyglot'

	" comment out lines with gcc
	Plug 'tpope/vim-commentary'

	" Insert or delete brackets, parens, quotes in pair
	Plug 'jiangmiao/auto-pairs'

	" mark git changes
	Plug 'mhinz/vim-signify'

	" colors
	Plug 'jacoborus/tender.vim'

	" status line
	Plug 'vim-airline/vim-airline'

	" code completion
	Plug 'maralla/completor.vim', { 'dir': '~/.vim/plugged/completor.vim/pythonx/completers/javascript', 'do': 'make js'}
	let g:completor_python_binary = $HOME . '/.vim/venv/bin/python'
	let g:completor_filetype_map = {'go': {'ft': 'lsp', 'cmd': 'gopls'}}
	inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

	" linting support
	Plug 'dense-analysis/ale'
	let g:ale_fix_on_save = 1
	let g:ale_fixers = {
	\	'*': [
	\		'remove_trailing_lines',
	\		'trim_whitespace',
	\	],
	\	'python': [
	\		'add_blank_lines_for_python_control_statements',
	\		'remove_trailing_lines',
	\		'trim_whitespace',
	\	],
	\	'javascript': [
	\		'eslint',
	\		'remove_trailing_lines',
	\		'trim_whitespace',
	\	],
	\	'jsx': [
	\		'eslint',
	\		'remove_trailing_lines',
	\		'trim_whitespace',
	\	],
	\	'go': [
	\		'gofmt',
	\		'goimports',
	\		'remove_trailing_lines',
	\		'trim_whitespace',
	\	],
	\}
	let g:ale_python_flake8_executable = $HOME . '/.vim/venv/bin/flake8'
	let g:ale_python_mypy_executable = $HOME . '/.vim/venv/mypy'

	" highlight uses of word under cursor
	Plug 'RRethy/vim-illuminate'
	hi link illuminatedWord Visual
	let g:Illuminate_delay = 150  " default 250
	"
	" fancy file explorer
	Plug 'preservim/nerdtree'
	let NERDTreeMinimalUI=1
	let NERDTreeShowHidden=1
	command Ex NERDTree

" Initialize plugin system
call plug#end()


""""""""""""""""
""" settings """
""""""""""""""""
set nowrap  " don't wrap long lines
set tabstop=2  " a tab is 2 spaces
set softtabstop=2  " number of spaces to remove on <BS>
set noexpandtab  " don't replace tabs with spaces
set shiftwidth=2  " number of spaces for autoindenting
set shiftround  " indent rounded to shiftwidth
set autoindent  " preserve indentation on next line
set scrolloff=8  " leave n lines between the cursor and edge of screen
set autowrite  " save file on certain actions
set nobackup  " don't keep backup files
set nowritebackup  " don't write backup files
set spell  " enable spell checking
set spelllang=en_us
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType markdown setlocal wrap linebreak breakat&vim
autocmd FileType text setlocal wrap linebreak breakat&vim

" expand all folds when opening a file
autocmd BufRead * normal zR

" remove delay after typing Shift-o (insert line above)
" https://github.com/vim/vim/issues/24#issuecomment-132350171
:set timeout timeoutlen=5000 ttimeoutlen=100

" configure color scheme
set t_ut= " https://superuser.com/a/562423
syntax enable
colorscheme tender
let g:airline_theme = 'tender'
if exists('+termguicolors')
	set termguicolors
endif

" keep this at the end of this file
set exrc  " allow reading .vimrc file in current directory
set secure  " disable unsafe cmds from .vimrc in current directory
