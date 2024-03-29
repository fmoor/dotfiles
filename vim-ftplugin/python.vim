set tabstop=4  " a tab is 2 spaces
set softtabstop=4  " number of spaces to remove on <BS>
set shiftwidth=4  " number of spaces for auto indenting
set expandtab

let b:coc_root_patterns = ['.git', 'setup.cfg', 'setup.py', '.eggs', 'pyproject.toml']

nmap rn <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
nmap rr <Plug>(coc-references)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)

xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)

xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap K <Plug>(coc-hover)
