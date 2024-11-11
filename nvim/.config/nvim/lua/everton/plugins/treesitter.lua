return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({

            ensure_installed = {
                "bash",
                "c",
                "java",
                "diff",
                "html",
                "css",
                "styled",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "query",
                "vim",
                "go",
                "javascript",
                "typescript",
                "jsdoc",
            },

            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            use_virtual_text = true,
        })
    end,
}
