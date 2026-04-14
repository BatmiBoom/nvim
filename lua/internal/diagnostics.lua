vim.diagnostic.config {
  underline = true,
  virtual_lines = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    current_line = true,
    source = 'if_many',
  },
  severty_sort = true,
}
