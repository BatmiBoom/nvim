return {
  {
    'linrongbin16/fzfx.nvim',
    dependencies = { 'echasnovski/mini.icons', 'junegunn/fzf' },
    keys = {
      {
        '<leader><leader>',
        ':FzfxFiles<CR>',
      },
      {
        '<leader>fw',
        ':FzfxLiveGrep<CR>',
      },
      {
        '<leader>ff',
        ':FzfxLs<CR>',
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>fb', ':FzfxBuffers<CR>', { desc = '[L]ist open buffers' })
      require('fzfx').setup()

      require('fzfx').register('ls', {
        --- @type fzfx.CommandConfig
        command = {
          name = 'FzfxLs',
          desc = 'File Explorer (ls -1)',
        },
        variants = {
          {
            name = 'args',
            feed = 'args',
            default_provider = 'filter_hiddens',
          },
          {
            name = 'hidden_args',
            feed = 'args',
            default_provider = 'include_hiddens',
          },
        },
        --- @type table<string, fzfx.ProviderConfig>
        providers = {
          filter_hiddens = {
            key = 'ctrl-h',
            provider = { 'ls', '--color=always', '-1' },
            provider_type = 'COMMAND_ARRAY',
          },
          include_hiddens = {
            key = 'ctrl-u',
            provider = { 'ls', '--color=always', '-1a' },
            provider_type = 'COMMAND_ARRAY',
          },
        },
        --- @type table<string, fzfx.PreviewerConfig>
        previewers = {
          filter_hiddens = {
            previewer = function(line)
              -- each line is either a folder or a file
              return vim.fn.isdirectory(line) > 0 and { 'ls', '--color=always', '-lha', line } or { 'cat', line }
            end,
            previewer_type = 'COMMAND_ARRAY',
          },
          include_hiddens = {
            previewer = function(line)
              return vim.fn.isdirectory(line) > 0 and { 'ls', '--color=always', '-lha', line } or { 'cat', line }
            end,
            previewer_type = 'COMMAND_ARRAY',
          },
        },
        actions = {
          ['esc'] = function(lines)
            -- do nothing
          end,
          ['enter'] = function(lines)
            for _, line in ipairs(lines) do
              vim.cmd(string.format([[edit %s]], line))
            end
          end,
        },
        fzf_opts = {
          '--multi',
          { '--prompt', 'Ls > ' },
        },
      })
    end,
  },
}
