return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        theme = 'dragon', -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = 'dragon', -- try "dragon" !
          light = 'dragon',
        },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
                bg = 'none',
              },
            },
          },
        },

        overrides = function(colors)
          local theme = colors.theme

          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end

          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            -- For visulal selection
            Visual = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            -- DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            -- DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            -- DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            -- DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
          }
        end,
      }

      vim.cmd 'colorscheme kanagawa-dragon'
    end,
  },
  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   config = function()
  --     ---@diagnostic disable-next-line: missing-fields
  --     require('tokyonight').setup {
  --       styles = {
  --         comments = { italic = false }, -- Disable italics in comments
  --       },
  --     }
  --
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-night'
  --   end,
  -- },
}
-- return {
--   {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1000,
--     config = function()
--       require('catppuccin').setup {
--         flavour = 'auto', -- latte, frappe, macchiato, mocha
--         background = { -- :h background
--           light = 'latte',
--           dark = 'mocha',
--         },
--         transparent_background = true, -- disables setting the background color.
--         show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--         term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--         dim_inactive = {
--           enabled = false, -- dims the background color of inactive window
--           shade = 'dark',
--           percentage = 0.15, -- percentage of the shade to apply to the inactive window
--         },
--         no_italic = false, -- Force no italic
--         no_bold = false, -- Force no bold
--         no_underline = false, -- Force no underline
--         styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--           comments = { 'italic' }, -- Change the style of comments
--           conditionals = { 'italic' },
--           loops = {},
--           functions = {},
--           keywords = {},
--           strings = {},
--           variables = {},
--           numbers = {},
--           booleans = {},
--           properties = {},
--           types = {},
--           operators = {},
--           -- miscs = {}, -- Uncomment to turn off hard-coded styles
--         },
--         color_overrides = {},
--         custom_highlights = {},
--         default_integrations = true,
--         integrations = {
--           cmp = true,
--           gitsigns = true,
--           nvimtree = true,
--           treesitter = true,
--           notify = false,
--           mini = {
--             enabled = true,
--             indentscope_color = '',
--           },
--           -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--         },
--       }
--
--       -- setup must be called before loading
--       vim.cmd.colorscheme 'catppuccin'
--     end,
--   },
-- }
-- return { -- You can easily change to a different colorscheme.
--   -- Change the name of the colorscheme plugin below, and then
--   -- change the command in the config to whatever the name of that colorscheme is.
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   'folke/tokyonight.nvim',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   config = function()
--     ---@diagnostic disable-next-line: missing-fields
--     require('tokyonight').setup {
--       transparent = true,
--       styles = {
--         comments = { italic = false }, -- Disable italics in comments
--       },
--     }
--
--     -- Load the colorscheme here.
--     -- Like many other themes, this one has different styles, and you could load
--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     vim.cmd.colorscheme 'tokyonight-moon'
--   end,
--   -- {
--   --   'rebelot/kanagawa.nvim',
--   --   priority = 1000,
--   --   config = function()
--   --     require('kanagawa').setup {
--   --       theme = 'wave', -- Load "wave" theme
--   --       background = { -- map the value of 'background' option to a theme
--   --         dark = 'wave', -- try "dragon" !
--   --         light = 'lotus',
--   --       },
--   --       typeStyle = {},
--   --       transparent = true, -- do not set background color
--   --       dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--   --       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--   --       compile = false, -- enable compiling the colorscheme
--   --       undercurl = true, -- enable undercurls
--   --       commentStyle = { italic = true },
--   --       functionStyle = {},
--   --       keywordStyle = { italic = true },
--   --       statementStyle = { bold = true },
--   --       colors = {
--   --         theme = {
--   --           all = {
--   --             ui = {
--   --               bg_gutter = 'none',
--   --               bg = 'none',
--   --             },
--   --           },
--   --         },
--   --       },
--   --
--   --       overrides = function(colors)
--   --         local theme = colors.theme
--   --
--   --         local makeDiagnosticColor = function(color)
--   --           local c = require 'kanagawa.lib.color'
--   --           return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
--   --         end
--   --
--   --         return {
--   --           NormalFloat = { bg = 'none' },
--   --           FloatBorder = { bg = 'none' },
--   --           FloatTitle = { bg = 'none' },
--   --
--   --           -- Save an hlgroup with dark background and dimmed foreground
--   --           -- so that you can use it where your still want darker windows.
--   --           -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
--   --           NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
--   --
--   --           -- Popular plugins that open floats will link to NormalFloat by default;
--   --           -- set their background accordingly if you wish to keep them dark and borderless
--   --           LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--   --           MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--   --           Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
--   --           PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
--   --           PmenuSbar = { bg = theme.ui.bg_m1 },
--   --           PmenuThumb = { bg = theme.ui.bg_p2 },
--   --           -- For visulal selection
--   --           Visual = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--   --
--   --           -- DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
--   --           -- DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
--   --           -- DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
--   --           -- DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
--   --         }
--   --       end,
--   --     }
--   --
--   --     vim.cmd 'colorscheme kanagawa-wave'
--   --   end,
--   -- },
-- }
