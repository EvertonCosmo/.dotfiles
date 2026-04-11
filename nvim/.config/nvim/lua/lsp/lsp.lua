local M = {}

M.on_attach = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  local buffer = event.buf

  if not client then
    return
  end

  -- Enable inlay hints when the server supports them.
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#868a91", italic = true })
  end

  local keymapset = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = buffer }


  -- Default Neovim
  --   K        → vim.lsp.buf.hover()
  --   gra      → vim.lsp.buf.code_action()
  --   grr      → vim.lsp.buf.references()
  --   grn      → vim.lsp.buf.rename()
  --   gri      → vim.lsp.buf.implementation()
  --   grt      → vim.lsp.buf.type_definition()
  --   gO       → vim.lsp.buf.document_symbol()
  --   <C-s>    → vim.lsp.buf.signature_help() (insert mode)
  --   Also sets 'omnifunc', 'tagfunc', 'formatexpr' automatically.
  -- Only override / add what differs from those defaults.

  keymapset("n", "gD", vim.lsp.buf.declaration, opts)


  keymapset("n", "gd", function()
    require("fzf-lua").lsp_definitions({
      jump1 = true,
    })
  end, opts)

  keymapset("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)

  keymapset("n", "<leader>ca", function()
    require("fzf-lua").lsp_code_actions({
      previewer = false,
      winopts = {
        width = 0.5,
        height = 0.3,
        border = "rounded",
        row = 0.5,
        col = 0.5,
      },
    })
  end, opts)

  -- diagnostics
  keymapset("n", "<leader>D", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, opts)

  keymapset("n", "<leader>d", vim.diagnostic.open_float, opts)

  keymapset("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts)

  keymapset("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts)

  keymapset("n", "K", function()
    require("pretty_hover").hover()
  end, opts)

  keymapset("n", "<leader>rs", ":LspRestart<CR>", opts)

  keymapset("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)
  keymapset("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
  keymapset("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
  keymapset("n", "<leader>ws", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts)
end

return M
