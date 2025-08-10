return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  opts = {
    provider = 'openai',
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
      },
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-sonnet-4-20250514',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      ollama = {
        endpoint = 'http://127.0.0.1:11434',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 20480,
            keep_alive = '5m',
          },
        },
      },
    },
  },
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ibhagwan/fzf-lua',
    'echasnovski/mini.icons',
  },
}
