return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      local highlight = function(bufnr, lang)
        if not vim.treesitter.language.add(lang) then
          return vim.notify(
            string.format("Treesitter cannot load parser for language: %s", lang),
            vim.log.levels.INFO,
            { title = "Treesitter" }
          )
        end
        vim.treesitter.start(bufnr)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype
          local buf = args.buf

          if bt ~= "" then
            return
          end -- don't run further.

          local ok, treesitter = pcall(require, "nvim-treesitter")
          if not ok then
            return
          end

          --------------------[ treesitter folds ]-------------------------------

          if ft == "javascriptreact" or ft == "typescriptreact" then
            vim.opt_local.foldmethod = "indent"
          else
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end

          vim.schedule(function()
            -- Only run normal if we're not in terminal mode
            if vim.fn.mode() ~= "t" then
              vim.cmd "silent! normal! zx"
            end
          end)


          if not vim.tbl_contains({ "python", "html", "yaml", "markdown" }, ft) then
            vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          end

          if vim.fn.executable "tree-sitter" ~= 1 then
            vim.api.nvim_echo({
              {
                "tree-sitter CLI not found. Parsers cannot be installed.",
                "ErrorMsg",
              },
            }, true, {})
            return false
          end

          if not vim.treesitter.language.get_lang(ft) then
            return
          end

          if vim.list_contains(treesitter.get_installed(), ft) then
            highlight(buf, ft)
          elseif vim.list_contains(treesitter.get_available(), ft) then
            treesitter.install(ft):await(function()
              highlight(buf, ft)
            end)
          end
        end,
      })
    end,
    opts = {
      install = {
        "css",
        "comment",
        "markdown",
        "markdown_inline",
        "regex",
        "vimdoc",
        "json5",
        "hyprlang"
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
    },
    config = function(_, opts)
      local treesitter = require "nvim-treesitter"
      treesitter.setup(opts)
      if vim.fn.executable "tree-sitter" ~= 1 then
        vim.api.nvim_echo({
          {
            "tree-sitter CLI not found. Parsers cannot be installed.",
            "ErrorMsg",
          },
        }, true, {})
        return false
      end
      treesitter.install(opts.install)
    end,
  }, {
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
