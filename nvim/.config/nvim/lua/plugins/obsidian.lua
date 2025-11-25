return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	cmd = "Obsidian",
	ft = "markdown",
	opts = {
		ui = { enable = true },
		legacy_commands = false,
		workspaces = { { name = "notes", path = "~/notes" } },
	},
}
