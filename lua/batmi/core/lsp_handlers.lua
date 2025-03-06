-- diagnostic
vim.diagnostic.config {
  underline = true,
  virtual_text = false,
  signs = true,

  float = {
    show_header = true,
    border = 'rounded',
    source = true,
  },

  severity_sort = true,
  update_in_insert = false,
}
