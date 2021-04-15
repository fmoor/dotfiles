set tabstop=2  " a tab is 2 spaces
set softtabstop=2  " number of spaces to remove on <BS>
set shiftwidth=2  " number of spaces for autoindenting
set noexpandtab

nnoremap <leader>b  :GoBuild<cr>
nnoremap <leader>r  :GoRun<cr>
nnoremap <leader>tr :GoTest<cr>
nnoremap <leader>tb :GoTestCompile<cr>

" Plug 'nvim-lua/completion-nvim'
let b:completion_matching_strategy_list = ['exact', 'fuzzy', 'substring', 'all']
