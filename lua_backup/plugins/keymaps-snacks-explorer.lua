return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", function() require("snacks").picker.explorer() end, desc = "Explorer (Snacks)" },
    },
  },
}