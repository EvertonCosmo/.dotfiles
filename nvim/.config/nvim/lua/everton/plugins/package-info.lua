return {

	"vuki656/package-info.nvim",

	config = function()
		require("package-info").setup({
			autostart = false,
			package_manager = "yarn",
			colors = {
				outdated = "#db4b4b",
			},
			hide_up_to_date = true,
		})
	end,
}
