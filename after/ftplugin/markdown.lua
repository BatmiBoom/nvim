vim.opt_local.wrap = true
vim.opt_local.spell = true

-- refresh codelens on TextChanged and InsertLeave as well
vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave', 'CursorHold', 'LspAttach' }, {
  buffer = 0,
  callback = vim.lsp.codelens.refresh,
})

vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
