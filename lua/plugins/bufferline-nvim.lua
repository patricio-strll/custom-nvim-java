return {
    'akinsho/bufferline.nvim',
    config = function ()
        require("bufferline").setup{}
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    }
}
