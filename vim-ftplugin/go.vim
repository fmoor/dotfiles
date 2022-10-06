set tabstop=4  " a tab is 2 spaces
set softtabstop=4  " number of spaces to remove on <BS>
set shiftwidth=4  " number of spaces for auto indenting
set noexpandtab

let g:argwrap_tail_comma = 1

nnoremap <leader>b  :GoBuild<cr>
nnoremap <leader>r  :GoRun<cr>
nnoremap <leader>tr :GoTest<cr>
nnoremap <leader>tb :GoTestCompile<cr>

nmap rr <Plug>(coc-references)

nmap <buffer> <silent> gm <Plug>(coc-menu)
nmap <buffer> <silent> K <Plug>(coc-hover)
nmap <buffer> <silent> gd <Plug>(go-def)
nmap <buffer> <silent> 1gD <Plug>(go-type-def)
nmap <buffer> <silent> gr <Plug>(go-referrers)
nmap <buffer> <silent> rn <Plug>(go-rename)
