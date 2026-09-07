local function lsp_supports_rename(bufnr)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client:supports_method("textDocument/rename", { bufnr = bufnr }) then
      return true
    end
  end
  return false
end

local function popup_rename_all()
  local bufnr = vim.api.nvim_get_current_buf()

  if not lsp_supports_rename(bufnr) then
    vim.notify("Kein LSP-Rename fuer diesen Buffer verfuegbar.", vim.log.levels.WARN)
    return
  end

  vim.lsp.buf.rename()
end

if vim.fn.exists(":LspRenameAll") == 2 then
  pcall(vim.api.nvim_del_user_command, "LspRenameAll")
end

vim.api.nvim_create_user_command("LspRenameAll", popup_rename_all, {
  desc = "Rename current symbol across the LSP workspace",
})

-- Extend the built-in right-click popup menu with the same LSP rename used by <leader>cr.
vim.cmd([[silent! aunmenu PopUp.Rename\ All]])
vim.cmd([[anoremenu PopUp.Rename\ All <Cmd>LspRenameAll<CR>]])
