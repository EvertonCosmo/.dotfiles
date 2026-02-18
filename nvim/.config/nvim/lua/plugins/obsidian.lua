return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cmd = "Obsidian",
  ft = "markdown",
  enabled = false,
  opts = {
    ui = { enable = true },
    legacy_commands = false,
    workspaces = { { name = "notes", path = "~/notes" } },
  },
}
