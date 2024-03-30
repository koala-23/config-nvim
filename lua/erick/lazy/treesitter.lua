return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufNewFile", "BufReadPre" },
    dependencies = {
        { "windwp/nvim-ts-autotag", config = true },
        { "windwp/nvim-autopairs",  config = true }
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "jsdoc", "bash", "vimdoc", "javascript", "typescript", "c", "lua", "rust", "java", "go", "astro", "html",
                "css", "tsx", "vue"
            },
            sync_install = false,
            auto_install = false,
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    node_decremental = "<C-space>-",
                    scope_incremental = "<C-space>c",
                },
            },
        })
    end
}
