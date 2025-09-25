return {
	"vyfor/cord.nvim",
	-- build = "./build || .\\build",
	build = ":Cord update",
	event = "VeryLazy",
	opts = {
		display = {
			show_repository = false,
		},
		text = {
			workspace = "",
		},
	}, -- calls require('cord').setup()
}
