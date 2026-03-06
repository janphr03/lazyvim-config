return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.explorer = opts.picker.sources.explorer or {}

      -- Always show dotfiles like .gitignore
      opts.picker.sources.explorer.hidden = true

      opts.picker.sources.explorer.git_status = true
      opts.picker.sources.explorer.git_status_open = true
      opts.picker.sources.explorer.git_untracked = true
      opts.picker.sources.explorer.icons = opts.picker.sources.explorer.icons or {}
      opts.picker.sources.explorer.icons.git = vim.tbl_deep_extend(
        "force",
        opts.picker.sources.explorer.icons.git or {},
        {
          enabled = true,
          added = "● ",
          modified = "M ",
          deleted = "D ",
          renamed = "R ",
          unmerged = "U ",
          staged = "● ",
          untracked = "● ",
          ignored = "◌ ",
        }
      )
      return opts
    end,
    keys = {
      { "<leader>e", function() require("snacks").picker.explorer() end, desc = "Explorer (Snacks)" },
      {
        "<leader>E",
        function()
          require("snacks").picker.explorer({ cwd = vim.fn.expand("~/.config/nvim") })
        end,
        desc = "Explorer (~/.config/nvim)",
      },
    },
  },
}
