return {
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>tw",
				function()
					require("neotest").run.run({ jestCommand = "npx jest --watch " })
				end,
				desc = "Run Watch",
			},
			{
				"<leader>tt",
				function()
					require("neotest").run.run({ jestCommand = "npx jest --watchAll " })
				end,
				desc = "Run All Tests",
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run All Tests in Current File",
			},
			{
				"<leader>tc",
				function()
					require("neotest").run.run({ jestCommand = "npx jest --watchAll --coverage " })
				end,
				desc = "Run All Tests with Coverage",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run Last Test",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Current Test",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Test Summary",
			},
		},
		opts = function(_, opts)
			opts.adapters = opts.adapters or {}

			local neotestjest = require("neotest-jest")({
				jestCommand = "npm test --",
				-- jestConfigFile = "custom.jest.config.ts",
				-- env = { CI = true },
				-- cwd = function()
				-- 	return vim.fn.getcwd()
				-- end,
			})

			neotestjest.filter_dir = function(name)
				return name ~= "node_modules" and name ~= "__snapshots__"
			end

			table.insert(opts.adapters, neotestjest)
			table.insert(opts.adapters, require("neotest-vitest"))
		end,
	},
}
