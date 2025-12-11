return {
	{ "AndreM222/copilot-lualine" },
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
    enabled = false,
		opts = {
			node_command = "node",
			server_opts_overrides = {},
			suggestion = {
				auto_trigger = true,
				keymap = {
					-- accept = "<C-j>",
					accept = false,
					accept_word = "<C-j>",
					accept_line = "<C-l>",
					-- next = "<M-]>",
					-- prev = "<M-[]>",
					dismiss = "<C-]>",
				},
			},
		},
	},
}
