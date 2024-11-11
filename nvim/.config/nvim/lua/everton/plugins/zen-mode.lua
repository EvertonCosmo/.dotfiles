return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    plugins = {
      gitsigns = { enabled = true },
      tmux = { enabled = true },
    },
  },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
