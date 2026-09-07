-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local user_help = require("config.user_help")

vim.api.nvim_create_user_command("Hilfe", function(opts)
  if opts.args == "" then
    user_help.select()
  else
    user_help.open(opts.args)
  end
end, {
  nargs = "?",
  desc = "Einfache deutsche Neovim-Hilfe öffnen",
  complete = function()
    return user_help.chapter_ids()
  end,
})

vim.keymap.set("n", "<F1>", user_help.select, { desc = "Einfache Neovim-Hilfe" })
vim.keymap.set("n", "<leader>h", user_help.select, { desc = "Einfache Neovim-Hilfe" })
