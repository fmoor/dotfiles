let g:argwrap_tail_comma = 1

nnoremap <leader>b  :GoBuild<cr>
nnoremap <leader>r  :GoRun<cr>
nnoremap <leader>tr :GoTest<cr>
nnoremap <leader>tb :GoTestCompile<cr>

nmap <buffer> <silent> gm <Plug>(coc-menu)
nmap <buffer> <silent> K <Plug>(coc-hover)
nmap <buffer> <silent> gd <Plug>(go-def)
nmap <buffer> <silent> 1gD <Plug>(go-type-def)
nmap <buffer> <silent> gr <Plug>(go-referrers)
nmap <buffer> <silent> rn <Plug>(go-rename)
