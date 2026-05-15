local function select_node(node)
  if not node then return end
  local srow, scol, erow, ecol = node:range()
  vim.api.nvim_win_set_cursor(0, { srow + 1, scol })
  vim.cmd("normal! v")
  vim.api.nvim_win_set_cursor(0, { erow + 1, math.max(ecol - 1, 0) })
end

local last_node

local function ts_expand()
  local node
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    node = last_node and last_node:parent() or vim.treesitter.get_node()
  else
    node = vim.treesitter.get_node()
  end
  last_node = node
  select_node(node)
end

local function ts_shrink()
  if not last_node then return end
  local child = last_node:child(0)
  if not child then return end
  last_node = child
  select_node(child)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
          if vim.bo[buf].buftype ~= "" then return end

          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then return end

          local nts = require("nvim-treesitter")

          local function enable()
            if not pcall(vim.treesitter.start, buf, lang) then return end
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end

          if vim.list_contains(nts.get_installed(), lang) then
            enable()
          elseif vim.list_contains(nts.get_available(), lang)
              and vim.fn.executable("tree-sitter") == 1 then
            nts.install(lang):await(function(err)
              if not err then enable() end
            end)
          end
        end,
      })

      vim.keymap.set({ "n", "x" }, "<C-Space>", ts_expand, { desc = "TS: expand node selection" })
      vim.keymap.set("x", "<BS>", ts_shrink, { desc = "TS: shrink node selection" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      line_numbers = true,
      max_lines = 5,
      multiwindow = false,
    },
  },
}
