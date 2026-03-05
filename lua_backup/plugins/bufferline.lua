return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}

      -- ASCII-only Zeichen, damit keine Nerd-Font Icons benoetigt werden.
      opts.options.get_element_icon = function()
        return "", ""
      end
      opts.options.show_buffer_icons = false
      opts.options.show_buffer_default_icon = false
      opts.options.color_icons = false

      -- Alle sichtbaren Marker im Tabline ebenfalls ASCII.
      opts.options.close_icon = "x"
      opts.options.buffer_close_icon = "x"
      opts.options.modified_icon = "*"
      opts.options.left_trunc_marker = "<"
      opts.options.right_trunc_marker = ">"
      opts.options.separator_style = { "|", "|" }
      opts.options.indicator = { style = "none" }

      -- Falls Offsets aktiv sind (z.B. Explorer), den Separator auf ASCII zwingen.
      if type(opts.options.offsets) == "table" then
        for _, offset in ipairs(opts.options.offsets) do
          if type(offset) == "table" then
            offset.separator = "|"
          end
        end
      end

      return opts
    end,
  },
}
