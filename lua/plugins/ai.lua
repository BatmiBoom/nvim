return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  opts = {
    provider = 'openai',
    openai = {
      endpoint = 'https://api.openai.com/v1',
      model = 'gpt-4o',
      timeout = 30000,
      temperature = 0,
      max_completion_tokens = 8192,
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
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
