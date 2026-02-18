return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.config")

      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "cpp",
          "java",
          "diff",
          "html",
          "css",
          "styled",
          "lua",
          "luadoc",
          "markdown_inline",
          "go",
          "javascript",
          "typescript",
          "python",
          "jsdoc",
          "json",
          "dockerfile",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        additional_vim_regex_highlighting = false,
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        use_virtual_text = true,
      })
    end,
  },
  {
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        line_numbers = true,
        max_lines = 5,
        multiwindow = false
      })
    end,
  }
}
