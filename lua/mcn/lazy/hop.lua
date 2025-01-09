return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    config = function()
        require('hop').setup()
        vim.keymap.set('n', '<leader>G', '<cmd>HopLine<CR>')
        vim.keymap.set('n', '<leader>w', '<cmd>HopWord<CR>')
    end
}
