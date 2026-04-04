return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  cmd = "Obsidian",
  ft = "markdown",
  enabled = true,
  opts = {
    ui = { enable = true },
    legacy_commands = false,
    workspaces = { { name = "notes", path = "~/notes" } },
  },
}
