-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Make split separators visible even after colorscheme changes
local group = vim.api.nvim_create_augroup("MyUIOverrides", { clear = true })

local function apply_ui()
  -- Splits
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff9e64", bold = true })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#ff9e64", bold = true })

  -- Cursor
  vim.opt.guicursor =
    "n-v-c:block-Cursor," ..
    "i-ci-ve:ver25-iCursor," ..
    "r-cr:hor20"
  vim.api.nvim_set_hl(0, "Cursor", { fg = "#222436", bg = "#ebf0eb" })
  vim.api.nvim_set_hl(0, "iCursor", { fg = "#222436", bg = "#ebf0eb" })

  -- CursorLine
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d2f3b" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#62a54e", bold = true })
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "UIEnter" }, {
  group = group,
  callback = function()
    vim.schedule(apply_ui)
  end,
})

local tweaks = vim.api.nvim_create_augroup("MyUIViewTweaks", { clear = true })

local function is_edit_window(win)
  if not vim.api.nvim_win_is_valid(win) then
    return false
  end
  if vim.api.nvim_win_get_config(win).relative ~= "" then
    return false
  end
  local buf = vim.api.nvim_win_get_buf(win)
  return vim.bo[buf].buftype == ""
end

local function refresh_window_focus()
  local current = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if is_edit_window(win) then
      local active = win == current
      vim.wo[win].cursorline = active
      if vim.wo[win].number then
        vim.wo[win].relativenumber = active
      else
        vim.wo[win].relativenumber = false
      end
    end
  end
end

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufEnter", "TabEnter", "FocusGained" }, {
  group = tweaks,
  callback = function()
    vim.schedule(refresh_window_focus)
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = tweaks,
  callback = function()
    if is_edit_window(vim.api.nvim_get_current_win()) then
      vim.wo.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = tweaks,
  callback = function()
    if is_edit_window(vim.api.nvim_get_current_win()) then
      vim.wo.cursorline = true
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = tweaks,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 })
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = tweaks,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = tweaks,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.cursorline = false
    vim.opt_local.list = false
  end,
})

apply_ui()
