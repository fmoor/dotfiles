" format on save
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
