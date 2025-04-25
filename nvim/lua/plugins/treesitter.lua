return {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "bash",
            "c",
            "html",
            "javascript",
            "json",
            "lua",
            "go",
            "markdown",
            "python",
            "typescript",
            "vim",
            "yaml",
          },
          highlight = { enable = true },
          indent = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              node_decremental = "<bs>",
            },
          },
        })
        vim.api.nvim_set_hl(0, "@keyword", { bold = true })
      end,
    },
}
