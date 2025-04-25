return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
          vim.opt.termguicolors = true
          require("bufferline").setup({
            options = {
              mode = "buffers",
              numbers = "ordinal",
              diagnostics = "nvim_lsp",
              separator_style = "slant",
            },
          })
        end,
    },
}
