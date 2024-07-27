return {
    'akinsho/bufferline.nvim',
    config = function()
        vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<cr>", { desc = "[B]ufferLine Next", silent = true })
        vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<cr>", { desc = "[B]ufferLine Prev", silent = true })
        vim.keymap.set("n", "<C-d>", ":BufferLineCloseOthers<cr>", { desc = "[B]ufferLine Prev", silent = true })
        require("bufferline").setup {}
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    }
}
