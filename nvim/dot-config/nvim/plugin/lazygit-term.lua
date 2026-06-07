local lazygit_state = {
  buf = nil,
  win = nil,
}

local function toggle_lazygit()
  -- 1. If window exists, close it
  if lazygit_state.win and vim.api.nvim_win_is_valid(lazygit_state.win) then
    vim.api.nvim_win_close(lazygit_state.win, true)
    lazygit_state.win = nil
    return
  end

  -- 2. Create buffer if needed
  if not lazygit_state.buf or not vim.api.nvim_buf_is_valid(lazygit_state.buf) then
    lazygit_state.buf = vim.api.nvim_create_buf(false, true)
  end
  
    local width = math.floor(vim.o.columns * 0.75)
    local height = math.floor(vim.o.lines * 0.75)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

  -- 3. Open floating window using that buffer
  lazygit_state.win = vim.api.nvim_open_win(lazygit_state.buf, true, {
    relative = "editor",
    style = "minimal",
    border = "rounded",
    width = width,
    height = height,
    col = col,
    row = row
  })

  -- 4. Start lazygit only if this is a fresh terminal buffer
  if vim.bo[lazygit_state.buf].buftype ~= "terminal" then
    vim.fn.jobstart("lazygit", {
      term = true,
      cwd = vim.fn.getcwd(),
    })
  end

  vim.cmd("startinsert")
end

vim.keymap.set('n', '<leader>lg', toggle_lazygit)
