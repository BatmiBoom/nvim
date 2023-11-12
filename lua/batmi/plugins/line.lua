return {
  lazy=false,
  "bluz71/nvim-linefly",
  config = function()
    vim.g.linefly_options = {
      separator_symbol = "⎪",
      progress_symbol = "↓",
      active_tab_symbol = "▪",
      git_branch_symbol = "",
      error_symbol = "E",
      warning_symbol = "W",
      information_symbol = "I",
      ellipsis_symbol = "…",
      tabline = false,
      winbar = false,
      with_file_icon = true,
      with_git_branch = true,
      with_git_status = true,
      with_diagnostic_status = true,
      with_session_status = true,
      with_lsp_names = true,
      with_macro_status = false,
      with_search_count = false,
      with_spell_status = false,
      with_indent_status = false,
    }
  end
}
