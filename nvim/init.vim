let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = ";"


""""""""""""""""
" load plugins "
""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

	Plug 'arcticicestudio/nord-vim'  " color scheme
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " go support
	Plug 'honza/vim-snippets'  " snippets
	Plug 'mhinz/vim-signify'  " mark git changes
	Plug 'tpope/vim-commentary'  " comment out lines with gcc
	Plug 'jiangmiao/auto-pairs'  " auto close brackets etc.
	Plug 'sheerun/vim-polyglot'  " A collection of language packs for Vim.
	Plug 'edgedb/edgedb-vim'  " EdgeDB syntax highlighting
	Plug 'wellle/targets.vim' " more text objects

	""""""""""""""""""""
	Plug 'SirVer/ultisnips'  " snippets engine
	""""""""""""""""""""
	let g:UltiSnipsExpandTrigger = '<c-l>'
	let g:UltiSnipsListSnippets = '<c-u>'
	let g:UltiSnipsEditSplit = 'vertical'

	""""""""""""""""""""
	Plug 'neovim/nvim-lspconfig'  " LSP support
	""""""""""""""""""""
	nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
	nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
	nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<cr>
	nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<cr>
	nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<cr>
	nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<cr>
	nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
	nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
	nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
	nnoremap <silent> rn    <cmd>lua vim.lsp.buf.rename()<cr>
	nnoremap <silent> [d    <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
	nnoremap <silent> ]d    <cmd>lua vim.lsp.diagnostic.goto_next()<cr>


	""""""""""""""""""""
	Plug 'nvim-lua/completion-nvim'  " autocompletion
	""""""""""""""""""""
	" Use completion-nvim in every buffer
	autocmd BufEnter * lua require'completion'.on_attach()

	" Use <C-j> and <C-k> to navigate through popup menu
	inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	cnoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
	cnoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

	" Set completeopt to have a better completion experience
	set completeopt=menuone,noinsert,noselect

	let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
	let g:completion_matching_smart_case = 1
	let g:completion_enable_snippet = 'UltiSnips'


	""""""""""""""""""""
	Plug 'kyazdani42/nvim-web-devicons'  " fancy icons
	""""""""""""""""""""
	" install a nerd font:
	" 	https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
	" install latest alacritty from source to support nerd fonts
	" https://github.com/alacritty/alacritty/blob/master/INSTALL.md
	

	""""""""""""""""""""
	Plug 'kyazdani42/nvim-tree.lua'  " file explorer
	""""""""""""""""""""
	" requires kyazdani42/nvim-web-devicons
	nnoremap <silent><C-n> :NvimTreeToggle<cr>
	nnoremap <silent><leader>r :NvimTreeRefresh<cr>
	nnoremap <silent><leader>n :NvimTreeFindFile<cr>

	let g:nvim_tree_ignore = ['.git']
	let g:nvim_tree_icons = {
			\ 'default': ' ',
			\ 'symlink': ' ',
			\ 'folder': {
			\   'default': "",
			\   'open': "",
			\   'empty': "",
			\   'empty_open': "",
			\   'symlink': "",
			\   'symlink_open': "",
			\   }
			\ }
	let g:nvim_tree_show_icons = {
			\ 'git': 1,
			\ 'folders': 1,
			\ 'files': 0,
			\ }

	" enable file highlight for git attributes
	let g:nvim_tree_git_hl = 1

	" append a trailing slash to folder names
	let g:nvim_tree_add_trailing = 1

	" compact folders that only contain a single folder
	let g:nvim_tree_group_empty = 1

	
	""""""""""""""""""""
	Plug 'nvim-telescope/telescope.nvim'  " fuzzy finder
	""""""""""""""""""""
	" install https://github.com/sharkdp/bat
	" install https://github.com/sharkdp/fd
	" install https://github.com/BurntSushi/ripgrep
	" requires neovim/nvim-lspconfig
	" requires kyazdani42/nvim-web-devicons
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " telescope dependency
	Plug 'nvim-lua/popup.nvim'  " telescope dependency
	Plug 'nvim-lua/plenary.nvim'  " telescope dependency
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>


	""""""""""""""""""""
	Plug 'chrisbra/Colorizer'  " color color codes with the color they represent
	""""""""""""""""""""
	" does nothing by default see :h Colorizer for commands
	
	" don't uncolor when leaving a buffer
	let g:colorizer_disable_bufleave = 1

	" disable the colorname highlighting i.e. red, green, etc.
	let g:colorizer_colornames_disable = 1


	""""""""""""""""""""
	Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}  " status line
	""""""""""""""""""""
	" requires kyazdani42/nvim-web-devicons
	Plug 'nvim-lua/plenary.nvim'  " gitsigns dependency
	Plug 'lewis6991/gitsigns.nvim'  " galaxyline dependency

	
call plug#end() 


""""""""""""""""""""""""
" Plugin configuration "
""""""""""""""""""""""""
let g:python3_host_prog = '/home/fmoor/.neovim-venv/bin/python'

lua << EOF
require('statusline')
local lspconf = require('lspconfig')

lspconf.gopls.setup{}
lspconf.rust_analyzer.setup{}
lspconf.html.setup{}

-- install deno https://github.com/denoland/deno
lspconf.denols.setup{
	init_options = {
		enable = true,
		lint = true,
		unstable = false,
	}
}

-- pip install python-language-server[all] pyls-mypy
lspconf.pyls.setup{settings = {pyls = {plugins = {
	jedi_completion = {
		fuzy = true,
	},
	pyls_mypy = {
		enabled = true,
		live_mode = false,
	},
}}}}

-- npm install -g svelte-language-server
lspconf.svelte.setup{}

require('nvim-treesitter.configs').setup {
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "maintained", 

	highlight = {
		-- false will disable the whole extension
		enable = false,              
	},
}
EOF


""""""""""""""""""""
" general settings "
""""""""""""""""""""
set autoindent  " preserve indentation on next line
set autowrite  " save file on certain actions
set autowrite  " save file on certain actions
set cursorline  " highlight the current line
set scrolloff=8  " leave n lines between the cursor and edge of screen
set spell  " enable spell checking
set spelllang=en_us
set relativenumber " Relative line numbers on left.
set number " hybrid mode relative number

" invoke :nohlsearch  with <cr>
nnoremap <cr> :nohlsearch<cr><cr>

filetype plugin on

autocmd BufNewFile,BufRead .envrc setfiletype bash

" https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
set termguicolors
syntax on
colorscheme nord

" make line offset numbers a little brighter
" https://github.com/arcticicestudio/nord-vim/blob/ea7ff9c343392ec6dfac4e9ec3fe0c45afb92a40/colors/nord.vim#L23
highlight LineNr ctermfg=8 guifg=#616E88


"---------- keep this at the end of this file ---------- "
set exrc  " allow reading .vimrc file in current directory
set secure  " disable unsafe cmds from .vimrc in current directory
