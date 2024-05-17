local hl_store = {}

hl_store['@markup.heading.1.markdown'] = { link = 'Identifier' }
hl_store['@markup.heading.2.markdown'] = { link = 'Function' }
hl_store['@markup.strong.markdown_inline'] = { link = 'Keyword' }
hl_store['@markup.italic.markdown_inline'] = { link = 'Keyword' }

for group, hl in pairs(hl_store) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- refresh codelens on TextChanged and InsertLeave as well
vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave', 'CursorHold', 'LspAttach' }, {
  buffer = bufnr,
  callback = vim.lsp.codelens.refresh,
})

-- trigger codelens refresh
vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
