-- return {
--   "Fildo7525/pretty_hover",
--   event = "LspAttach",
--   config = function()
--     require("pretty_hover").setup({})
--   end
-- }

return {
  "lewis6991/hover.nvim",
  init = function()
    require("hover.providers.lsp")
    require("hover.providers.gh")
    require("hover.providers.gh_user")
    require("hover.providers.jira")
    require("hover.providers.dap")
    require("hover.providers.man")
    require("hover.providers.dictionary")
  end,
  opts = {
    preview_opts = {
      border = "rounded",
    },
  },
  -- stylua: ignore
  keys = {
    { "K", function() require("hover").hover() end, desc = "Hover" },
    { "gk", function() require("hover").hover_select() end, desc = "Hover Select" },
  },
}
