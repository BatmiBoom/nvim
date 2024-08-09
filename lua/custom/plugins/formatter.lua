return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    local slow_format_filetypes = {}
    require('conform').setup {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        ocaml = { 'ocamlformat' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        svelte = { 'prettierd' },
        yaml = { 'prettierd' },
        graphql = { 'prettierd' },
        markdown = { 'prettierd' },
        gleam = { 'gleam' },
      },
      format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match 'timeout$' then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_format = 'fallback' }, on_format
      end,
      format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_format = 'fallback' }
      end,
    }
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
