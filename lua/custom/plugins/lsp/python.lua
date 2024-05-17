return {
  'AckslD/swenv.nvim',
  config = function()
    require('swenv').setup {
      get_venvs = function(venvs_path)
        return require('swenv.api').get_venvs(venvs_path)
      end,
      post_set_venv = function()
        vim.cmd 'LspRestart'
      end,
    }
  end,
  keys = {
    {
      '<leader>pv',
      mode = { 'n' },
      function()
        require('swenv.api').pick_venv()
      end,
      desc = 'Select Python Env',
    },
  },
}
