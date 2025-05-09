return {

	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	opts = {
		enable_abbr = true,
		enable_bracket_in_quote = true,
		map_c_h = false,
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
