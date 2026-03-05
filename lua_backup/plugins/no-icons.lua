return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local function blank_icons(value)
        if type(value) ~= "table" then
          return
        end
        for k, v in pairs(value) do
          if type(v) == "string" then
            value[k] = ""
          elseif type(v) == "table" then
            blank_icons(v)
          end
        end
      end

      blank_icons(opts.icons)
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.get_element_icon = function()
        return "", ""
      end
      opts.options.close_icon = "x"
      opts.options.buffer_close_icon = "x"
      opts.options.modified_icon = "*"
      opts.options.show_buffer_icons = false
      opts.options.show_buffer_default_icon = false
      opts.options.color_icons = false
      opts.options.left_trunc_marker = "<"
      opts.options.right_trunc_marker = ">"
      opts.options.separator_style = { "|", "|" }
      opts.options.indicator = { style = "none" }
      return opts
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local section = opts.sections and opts.sections.lualine_c
      if type(section) ~= "table" then
        return opts
      end

      local filtered = {}
      for _, item in ipairs(section) do
        local is_filetype_icon =
          type(item) == "table" and item[1] == "filetype" and item.icon_only == true
        if not is_filetype_icon then
          filtered[#filtered + 1] = item
        end
      end
      opts.sections.lualine_c = filtered
      return opts
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      if type(opts.diagnostics.virtual_text) == "table" then
        opts.diagnostics.virtual_text.prefix = "*"
      end
      opts.diagnostics.signs = opts.diagnostics.signs or {}
      opts.diagnostics.signs.text = {
        [vim.diagnostic.severity.ERROR] = "E ",
        [vim.diagnostic.severity.WARN] = "W ",
        [vim.diagnostic.severity.HINT] = "H ",
        [vim.diagnostic.severity.INFO] = "I ",
      }
      return opts
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.signs = opts.signs or {}
      opts.signs.add = { text = "+" }
      opts.signs.change = { text = "~" }
      opts.signs.delete = { text = "-" }
      opts.signs.topdelete = { text = "-" }
      opts.signs.changedelete = { text = "~" }
      opts.signs.untracked = { text = "?" }

      opts.signs_staged = opts.signs_staged or {}
      opts.signs_staged.add = { text = "+" }
      opts.signs_staged.change = { text = "~" }
      opts.signs_staged.delete = { text = "-" }
      opts.signs_staged.topdelete = { text = "-" }
      opts.signs_staged.changedelete = { text = "~" }
      return opts
    end,
  },

  {
    "snacks.nvim",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local ok, util = pcall(require, "snacks.util")
          if ok then
            util.spinner = function()
              return "*"
            end
          end
        end,
      })
    end,
    opts = function(_, opts)
      local keys = opts.dashboard
        and opts.dashboard.preset
        and opts.dashboard.preset.keys
      if type(keys) ~= "table" then
        keys = nil
      end

      if keys then
        for _, item in ipairs(keys) do
          if type(item) == "table" then
            item.icon = ""
          end
        end
      end

      opts.picker = opts.picker or {}
      opts.picker.prompt = "> "
      opts.picker.icons = opts.picker.icons or {}
      opts.picker.icons.ui = opts.picker.icons.ui or {}
      opts.picker.icons.ui.live = ""
      opts.picker.formatters = opts.picker.formatters or {}
      opts.picker.formatters.severity = opts.picker.formatters.severity or {}
      opts.picker.formatters.severity.icons = false

      opts.notifier = opts.notifier or {}
      opts.notifier.icons = {
        error = "E ",
        warn = "W ",
        info = "I ",
        debug = "D ",
        trace = "T ",
      }

      opts.input = opts.input or {}
      opts.input.icon = "> "
      opts.input.icon_pos = "left"

      opts.statuscolumn = opts.statuscolumn or {}
      opts.statuscolumn.left = { "mark", "sign", "fold" }
      opts.statuscolumn.right = { "git" }
      opts.statuscolumn.folds = opts.statuscolumn.folds or {}
      opts.statuscolumn.folds.open = true
      opts.statuscolumn.folds.git_hl = false

      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.explorer = opts.picker.sources.explorer or {}
      opts.picker.sources.explorer.git_status = false
      opts.picker.sources.explorer.git_status_open = false
      opts.picker.sources.explorer.git_untracked = false
      opts.picker.sources.explorer.diagnostics = false
      opts.picker.sources.explorer.diagnostics_open = false
      opts.picker.sources.explorer.icons = opts.picker.sources.explorer.icons or {}
      opts.picker.sources.explorer.icons.files = opts.picker.sources.explorer.icons.files or {}
      opts.picker.sources.explorer.icons.files.enabled = false
      opts.picker.sources.explorer.icons.files.dir = "d "
      opts.picker.sources.explorer.icons.files.dir_open = "d "
      opts.picker.sources.explorer.icons.files.file = "* "
      opts.picker.sources.explorer.icons.git = opts.picker.sources.explorer.icons.git or {}
      opts.picker.sources.explorer.icons.git.enabled = false
      opts.picker.sources.explorer.icons.git.staged = "*"
      opts.picker.sources.explorer.icons.git.added = "+"
      opts.picker.sources.explorer.icons.git.deleted = "-"
      opts.picker.sources.explorer.icons.git.ignored = "i"
      opts.picker.sources.explorer.icons.git.modified = "*"
      opts.picker.sources.explorer.icons.git.renamed = ">"
      opts.picker.sources.explorer.icons.git.unmerged = "!"
      opts.picker.sources.explorer.icons.git.untracked = "?"
      opts.picker.sources.explorer.icons.tree = {
        vertical = "| ",
        middle = "|-",
        last = "`-",
      }
      opts.picker.sources.explorer.icons.ui = {
        live = "l ",
        hidden = "h",
        ignored = "i",
        follow = "f",
        selected = "* ",
        unselected = "  ",
      }
      opts.picker.sources.explorer.icons.diagnostics = {
        Error = "E ",
        Warn = "W ",
        Hint = "H ",
        Info = "I ",
      }

      return opts
    end,
  },
}
