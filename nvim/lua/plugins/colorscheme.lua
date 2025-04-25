return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- 可选值：'storm', 'moon', 'night', 'day'
  --     styles = {
  --       keywords = { italic = false },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
    -- {
    --     "EdenEast/nightfox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     options = {
    --         styles = {
    --             keywords = "bold",
    --         },
    --         inverse = {
    --             match_paren = true,
    --             visual = true,
    --             search = true,
    --         },
    --     },
    --     config = function()
    --         require("nightfox").setup(options)
    --         vim.cmd("colorscheme carbonfox")
    --     end,
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = true,
    --     config = function()
    --         vim.o.background = "dark"
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    -- },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        options = {
            keywordStyle = { italic = true},
            -- keywordStyle = { bold = true },
            theme = "wave",
        },
        config = function()
            -- Default options:
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = false },
                functionStyle = {},
                keywordStyle = { bold = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",              -- Load "wave" theme
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon" !
                    light = "lotus"
                },
            })

            -- setup must be called before loading
            vim.cmd("colorscheme kanagawa")
            -- require("kanagawa").setup(options)
            -- vim.cmd("colorscheme kanagawa-wave")
            -- vim.cmd("colorscheme kanagawa-dragon")
            -- vim.cmd("colorscheme kanagawa-lotus")
        end,
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme catppuccin-latte")
    --         -- vim.cmd("colorscheme catppuccin-frappe")
    --         -- vim.cmd("colorscheme catppuccin-macchiato")
    --         -- vim.cmd("colorscheme catppuccin-mocha")
    --     end,
    -- },
}
