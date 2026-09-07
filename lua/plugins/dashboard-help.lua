return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}

      table.insert(opts.dashboard.preset.keys, 1, {
        icon = "󰋖 ",
        key = "h",
        desc = "HILFE öffnen · F1 überall · Space h",
        action = ":Hilfe",
      })
      return opts
    end,
  },
}
