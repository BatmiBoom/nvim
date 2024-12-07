local M = {}

M.open_floating_window = function()
  local float_buf_id = vim.api.nvim_create_buf(false, true)
  local current_width = vim.api.nvim_win_get_width(0)
  local current_height = vim.api.nvim_win_get_height(0)

  -- Define floating window dimensions
  local float_width = math.floor(current_width * 0.8) -- 80% of the width
  local float_height = math.floor(current_height * 0.8) -- 80% of the height

  -- Calculate the position to center the floating window
  local col = math.floor((current_width - float_width) / 2)
  local row = math.floor((current_height - float_height) / 2)

  local float_win_id = vim.api.nvim_open_win(float_buf_id, true, {
    relative = 'win',
    width = float_width,
    height = float_height,
    col = col,
    row = row,
    style = 'minimal',
  })
  vim.api.nvim_cmd({ cmd = 'term' }, {})
end

return M
