local M = {}

local function get_mode()
  local modes = {
    ['n'] = { 'NORMAL', 'StatuslineNormal' },
    ['i'] = { 'INSERT', 'StatuslineInsert' },
    ['v'] = { 'VISUAL', 'StatuslineVisual' },
    ['V'] = { 'V-LINE', 'StatuslineVisual' },
    ['\22'] = { 'V-BOCK', 'StatuslineVisual' },
    ['c'] = { 'COMMAND', 'StatuslineCommand' },
    ['s'] = { 'SELECT', 'StatuslineVisual' },
    ['S'] = { 'S-LINE', 'StatuslineVisual' },
    ['\19'] = { 'S-BLOCK', 'StatuslineVisual' },
    ['r'] = { 'REPLACE', 'StatuslineReplace' },
    ['R'] = { 'REPLACE', 'StatuslineReplace' },
    ['t'] = { 'TERMINAL', 'StatuslineTerminal' },
  }

  local current_mode = vim.api.nvim_get_mode().mode
  local mode_info = modes[current_mode] or { 'UNKNOWN', 'StatuslineNormal' }
  return string.format('%%#%s# %s %%*', mode_info[2], mode_info[1])
end

local function get_file_info()
  local filename = vim.fn.expand '%:t'
  if filename == '' then
    filename = '[No Name]'
  end

  local modified = vim.bo.modified and ' [+]' or ''
  local readonly = vim.bo.readonly and ' [RO]' or ''

  return filename .. modified .. readonly
end

local function get_git_branch()
  local handle = io.popen 'git branch --show-current 2>/dev/null'
  if not handle then
    return ''
  end
  local branch = handle:read('*a'):gsub('\n', '')
  handle:close()

  if branch and branch ~= '' then
    return '%#StatuslineGit# ' .. branch .. '%*'
  end
  return ''
end
local function get_lsp_info()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients == 0 then
    return ''
  end

  local client_names = {}
  for _, client in pairs(clients) do
    table.insert(client_names, client.name)
  end

  local diagnostics = vim.diagnostic.get(0)
  local error_count = #vim.tbl_filter(function(d)
    return d.severity == vim.diagnostic.severity.ERROR
  end, diagnostics)
  local warn_count = #vim.tbl_filter(function(d)
    return d.severity == vim.diagnostic.severity.WARN
  end, diagnostics)

  local status = '  ' .. table.concat(client_names, ', ')
  if error_count > 0 then
    status = status .. ' %#StatuslineError# ' .. error_count .. '%*'
  end
  if warn_count > 0 then
    status = status .. ' %#StatuslineWarn# ' .. warn_count .. '%*'
  end

  return status
end

local function get_file_type()
  local ft = vim.bo.filetype
  if ft == '' then
    return ''
  end
  return ' ' .. ft:upper()
end

local function get_position()
  local line = vim.fn.line '.'
  local col = vim.fn.col '.'
  local total_lines = vim.fn.line '$'
  local percent = math.floor((line / total_lines) * 100)

  return string.format(' %d:%d %d', line, col, percent)
end

local function setup_highlights()
  local colors = {
    bg = '#24283b',
    fg = '#a9b1d6',
    blue = '#7aa2f7',
    green = '#9ece6a',
    yellow = '#e0af68',
    orange = '#ff9e64',
    red = '#f7768e',
    purple = '#bb9af7',
    cyan = '#7dcfff',
    gray = '#565f89',
  }

  vim.api.nvim_set_hl(0, 'StatuslineNormal', { fg = colors.bg, bg = colors.blue, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineInsert', { fg = colors.bg, bg = colors.green, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineVisual', { fg = colors.bg, bg = colors.purple, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineReplace', { fg = colors.bg, bg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineCommand', { fg = colors.bg, bg = colors.yellow, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineTerminal', { fg = colors.bg, bg = colors.cyan, bold = true })
  vim.api.nvim_set_hl(0, 'StatuslineError', { fg = colors.red, bg = colors.bg })
  vim.api.nvim_set_hl(0, 'StatuslineWarn', { fg = colors.orange, bg = colors.bg })
  vim.api.nvim_set_hl(0, 'StatuslineGit', { fg = colors.purple, bg = colors.bg })
end

function M.setup()
  setup_highlights()

  vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
    pattern = '*',
    callback = setup_highlights,
  })

  vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'ModeChanged', 'CursorMoved' }, {
    pattern = '*',
    callback = function()
      vim.opt.statusline = table.concat {
        get_mode(),
        '%=',
        get_file_info(),
        get_git_branch(),
        get_lsp_info(),
        '%=',
        get_file_type(),
        get_position(),
        '%%',
      }
    end,
  })
end

return M
