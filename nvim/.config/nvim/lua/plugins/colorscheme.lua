return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("nightfox").setup({
        options = {
          -- transparent = true,
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal
          dim_inactive = false,   -- Non focused panes set to alternative background
        },
      })
      -- vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    opts = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_foreground = "material" -- original, mix, material
      vim.g.gruvbox_material_background = "hard"     -- hard, medium, soft
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("melange")
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("onedark").setup({
        style = "warmer", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
        transparent = false,
        term_colors = true,
      })
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        transparent = false,
        italic_comments = true,
        hide_fillchars = false,
        terminal_colors = true,
      })
      -- vim.cmd([[colorscheme cyberdream]])
    end,
  },

  {
    "erikbackman/brightburn.vim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      -- vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('onedark').setup {
  --       style = 'darker',
  --       term_colors = true
  --     }
  --     require('onedark').load()
  --   end
  -- },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup({})
      vim.cmd.colorscheme("onedark")
    end
  }
  -- {
  --
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- These specific options match Feldman's "washed out" look:
  --     vim.g.gruvbox_material_background = 'medium' -- or 'soft'
  --     vim.g.gruvbox_material_foreground = 'material'
  --     vim.g.gruvbox_material_better_performance = 1
  --
  --     -- vim.cmd([[colorscheme gruvbox-material]])
  --   end,
  -- },
  -- {
  --   "Kopihue/one-dark-pro-max",
  --   name = "one-dark-pro-max",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("one-dark-pro-max").setup({
  --       transparent = false,
  --     })
  --     -- vim.cmd("colorscheme one-dark-pro-max")
  --   end
  -- }

}
