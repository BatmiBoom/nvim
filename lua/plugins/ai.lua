return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  opts = {
    providers = {
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o',
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_completion_tokens = 8192,
          reasoning_effort = 'medium',
        },
        -- ollama = {
        --   endpoint = 'http://127.0.0.1:11434',
        --   timeout = 30000, -- Timeout in milliseconds
        --   extra_request_body = {
        --     options = {
        --       temperature = 0.75,
        --       num_ctx = 20480,
        --       keep_alive = '5m',
        --     },
        --   },
        -- },
      },
    },
  },
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ibhagwan/fzf-lua',
    'echasnovski/mini.icons',
  },
}
