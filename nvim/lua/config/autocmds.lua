-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- disable spell checks for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

-- show trailing whitespaces
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("hi_trail_whsp", { clear = true }),
  callback = function()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype

    if buftype == "" and not vim.startswith(filetype, "Telescope") and filetype ~= "NvimTree" then
      -- Создаем группу подсветки
      vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "red" })

      -- Добавляем совпадение для пробелов в конце строки
      local match_id = vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])

      -- Очищаем совпадение при закрытии буфера
      -- vim.api.nvim_create_autocmd("BufWinLeave", {
      --   buffer = vim.api.nvim_get_current_buf(),
      --   callback = function()
      --     vim.fn.matchdelete(match_id)
      --   end,
      -- })
    end
  end,
  desc = "Highlight Trailing Whitespace",
})
