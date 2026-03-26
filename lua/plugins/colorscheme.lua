return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- Manual options you can enable later:
      -- style = "storm", -- "storm" | "night" | "moon" | "day"
      -- transparent = true,
      -- dim_inactive = true,
      -- styles = {
      --   sidebars = "transparent", -- "dark" | "transparent" | "normal"
      --   floats = "transparent",   -- "dark" | "transparent" | "normal"
      -- },
      on_highlights = function(hl, c)
        local plain = c.fg
        local self_fg = c.red1 or "#f7768e"
        local class_fg = "#ff8fd1"
        local orange = c.orange or "#ff9e64"
        local string_fg = "#769c4a"
        local scope_line = "#d4d9e6"
        local indent_line = "#5b6078"

        -- PyCharm-like plain text groups
        hl.Identifier = { fg = plain }
        hl.Function = { fg = plain }
        hl["@function"] = { fg = plain }
        hl["@function.call"] = { fg = plain }
        hl["@function.method"] = { fg = plain }
        hl["@function.builtin"] = { fg = plain }

        hl.String = { fg = string_fg }
        hl.Character = { fg = string_fg }
        hl["@string"] = { fg = string_fg }
        hl["@string.escape"] = { fg = string_fg }
        hl["@string.regex"] = { fg = string_fg }
        hl.Number = { fg = plain }
        hl.Boolean = { fg = plain }
        hl.Constant = { fg = plain }
        hl["@number"] = { fg = plain }
        hl["@boolean"] = { fg = plain }
        hl["@constant"] = { fg = plain }
        hl["@constant.builtin"] = { fg = plain }

        -- Keywords
        hl.Keyword = { fg = orange, bold = true }
        hl.Statement = { fg = orange, bold = true }
        hl.Conditional = { fg = orange, bold = true }
        hl.Repeat = { fg = orange, bold = true }
        hl.Exception = { fg = orange, bold = true }
        hl.Include = { fg = orange, bold = true }
        hl["@keyword"] = { fg = orange, bold = true }
        hl["@keyword.function"] = { fg = orange, bold = true }
        hl["@keyword.exception"] = { fg = orange, bold = true }
        hl["@keyword.return"] = { fg = orange, bold = true }
        hl["@keyword.conditional"] = { fg = orange, bold = true }
        hl["@keyword.repeat"] = { fg = orange, bold = true }
        hl["@keyword.import"] = { fg = orange, bold = true }

        -- Punctuation/operators plain
        hl.Operator = { fg = plain }
        hl.Delimiter = { fg = plain }
        hl["@operator"] = { fg = plain }
        hl["@punctuation"] = { fg = plain }
        hl["@punctuation.delimiter"] = { fg = plain }
        hl["@punctuation.bracket"] = { fg = plain }
        hl["@punctuation.special"] = { fg = plain }

        -- Variables/properties plain
        hl["@variable"] = { fg = plain }
        hl["@variable.python"] = { fg = plain }
        hl["@variable.member"] = { fg = plain }
        hl["@variable.member.python"] = { fg = plain }
        hl["@property"] = { fg = plain }
        hl["@property.python"] = { fg = plain }
        hl["@field"] = { fg = plain }
        hl["@field.python"] = { fg = plain }
        hl["@parameter"] = { fg = plain }
        hl["@parameter.python"] = { fg = plain }
        hl["@module"] = { fg = plain }
        hl["@namespace"] = { fg = plain }
        hl["@include"] = { fg = plain }

        -- Class/type names distinct
        hl.Type = { fg = class_fg }
        hl["@type"] = { fg = class_fg }
        hl["@type.builtin"] = { fg = class_fg }
        hl["@type.definition"] = { fg = class_fg }
        hl["@constructor"] = { fg = class_fg }
        hl["@lsp.type.class"] = { fg = class_fg }
        hl["@lsp.type.class.python"] = { fg = class_fg }
        hl["@lsp.type.class.lua"] = { fg = class_fg }
        hl["@lsp.type.class.javascript"] = { fg = class_fg }
        hl["@lsp.type.class.typescript"] = { fg = class_fg }
        hl["@lsp.type.interface"] = { fg = class_fg }
        hl["@lsp.type.struct"] = { fg = class_fg }
        hl["@lsp.type.type"] = { fg = class_fg }

        -- "self"
        hl["@variable.builtin"] = { fg = self_fg }
        hl["@variable.builtin.python"] = { fg = self_fg }
        hl["@lsp.type.selfKeyword"] = { fg = self_fg }
        hl["@lsp.type.selfKeyword.python"] = { fg = self_fg }

        -- LSP semantic tokens
        hl["@lsp.type.variable"] = { fg = plain }
        hl["@lsp.type.parameter"] = { fg = plain }
        hl["@lsp.type.property"] = { fg = plain }
        hl["@lsp.type.variable.python"] = { fg = plain }
        hl["@lsp.type.parameter.python"] = { fg = plain }
        hl["@lsp.type.property.python"] = { fg = plain }
        hl["@lsp.typemod.variable.global"] = { fg = plain }
        hl["@lsp.typemod.variable.global.python"] = { fg = plain }
        hl["@lsp.typemod.variable.fileScope"] = { fg = plain }
        hl["@lsp.typemod.variable.fileScope.python"] = { fg = plain }
        hl["@lsp.typemod.variable.readonly"] = { fg = plain }
        hl["@lsp.typemod.variable.readonly.python"] = { fg = plain }
        hl["@lsp.typemod.variable.defaultLibrary"] = { fg = plain }
        hl["@lsp.typemod.variable.defaultLibrary.python"] = { fg = plain }
        hl["@lsp.typemod.property.readonly"] = { fg = plain }
        hl["@lsp.typemod.property.readonly.python"] = { fg = plain }
        hl["@lsp.typemod.property.declaration"] = { fg = plain }
        hl["@lsp.typemod.property.declaration.python"] = { fg = plain }
        hl["@lsp.typemod.property.static"] = { fg = plain }
        hl["@lsp.typemod.property.static.python"] = { fg = plain }

        -- Indent/scope guides
        hl.SnacksIndent = { fg = indent_line }
        hl.SnacksIndent1 = { fg = indent_line }
        hl.SnacksIndent2 = { fg = indent_line }
        hl.SnacksIndent3 = { fg = indent_line }
        hl.SnacksIndent4 = { fg = indent_line }
        hl.SnacksIndent5 = { fg = indent_line }
        hl.SnacksIndent6 = { fg = indent_line }
        hl.SnacksIndent7 = { fg = indent_line }
        hl.SnacksIndent8 = { fg = indent_line }
        hl.SnacksIndentScope = { fg = scope_line, nocombine = true }
        hl.SnacksIndentChunk = { fg = scope_line, nocombine = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
