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
local class_pink = "#ff8fd1"

local function set_class_highlights()
  local groups = {
    "Type",
    "@type",
    "@type.builtin",
    "@type.definition",
    "@constructor",
    "@lsp.type.class",
    "@lsp.type.class.python",
    "@lsp.type.class.lua",
    "@lsp.type.class.javascript",
    "@lsp.type.class.typescript",
    "@lsp.type.interface",
    "@lsp.type.struct",
    "@lsp.type.type",
  }

  for _, group_name in ipairs(groups) do
    vim.api.nvim_set_hl(0, group_name, { fg = class_pink })
  end
end

local function set_indent_visibility(active)
  if active then
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent1", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent2", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent3", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent4", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent5", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent6", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent7", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndent8", { fg = "#5b6078" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#d4d9e6", nocombine = true })
    vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#d4d9e6", nocombine = true })
  else
    -- Very subtle fallback (~5% visibility feeling)
    vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent1", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent2", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent3", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent4", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent5", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent6", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent7", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndent8", { fg = "#2e3244" })
    vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#3b4057", nocombine = true })
    vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#3b4057", nocombine = true })
  end
end

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

local function apply_ui()
  -- Keep editor background transparent even after colorscheme reloads
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
  vim.opt.winblend = 0
  vim.opt.pumblend = 0

  -- Splits
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#565f89", bold = false })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#565f89", bold = false })

  -- Cursor
  vim.opt.guicursor =
    "n-v-c:block-Cursor-blinkon0," ..
    "i-ci-ve:ver35-iCursor-blinkwait200-blinkon250-blinkoff250," ..
    "r-cr-o:hor20-rCursor-blinkon0"
  vim.api.nvim_set_hl(0, "Cursor", { fg = "#222436", bg = "#ebf0eb" })
  vim.api.nvim_set_hl(0, "iCursor", { fg = "#222436", bg = "#ebf0eb" })
  vim.api.nvim_set_hl(0, "rCursor", { fg = "#222436", bg = "#ebf0eb" })

  -- CursorLine
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#262837" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#62a54e", bold = true })
  set_class_highlights()
  set_indent_visibility(true)
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "UIEnter" }, {
  group = group,
  callback = function()
    pcall(apply_ui)
  end,
})

local tweaks = vim.api.nvim_create_augroup("MyUIViewTweaks", { clear = true })

local function refresh_window_focus()
  local current = vim.api.nvim_get_current_win()
  local active_edit = is_edit_window(current)
  set_indent_visibility(active_edit)
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

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufEnter", "TabEnter", "FocusGained", "WinNew" }, {
  group = tweaks,
  callback = function()
    pcall(refresh_window_focus)
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
