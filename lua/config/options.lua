-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.have_nerd_font = true

vim.opt.fillchars = {
  horiz = "─", -- Linie zwischen Terminal und Code
  horizup = "┴",
  horizdown = "┬",
  vert = "│", -- Linie zwischen Explorer und Code
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = " ",
  fold = " ",
  diff = "╱",
  eob = " ",
}

vim.api.nvim_set_hl(0, "WinSeparator", {
  fg = "#565f89",
  bold = false,
})
vim.api.nvim_set_hl(0, "VertSplit", {
  fg = "#565f89",
  bold = false,
})
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"
vim.opt.spelllang = { "de", "en" }
