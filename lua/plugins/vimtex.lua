return {
  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_compiler_method = "latexmk"

      -- Win10 + WSL fallback: if zathura is not present, open PDF via Windows default app.
      if vim.fn.executable("zathura") == 1 then
        vim.g.vimtex_view_method = "zathura"
      elseif vim.fn.has("wsl") == 1 then
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "cmd.exe"
        vim.g.vimtex_view_general_options = '/c start "" "@pdf"'
      end
    end,
  },
}
