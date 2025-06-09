return {
	{ "AndreM222/copilot-lualine" },
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		copilot_model = "gpt-4o-copilot",
		node_command = "node",
		server_opts_overrides = {},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<tab>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[]>",
				dismiss = "<C-]>",
			},
		},
		panel = {
			enabled = false,
			auto_refresh = false,
			layout = {
				position = "right",
			},
		},
		filetypes = {
			markdown = true,
			help = true,
			gitcommit = true,
			gitrebase = true,
			css = true,
			less = true,
			javascript = true,
			typescript = true,
			typescriptreact = true,
			javascriptreact = true,
			["*"] = false,
		},
	},
}
