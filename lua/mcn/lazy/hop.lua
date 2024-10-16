return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },
    config = function()
        require('hop').setup()
        vim.keymap.set('n', '<leader>c', '<cmd>HopChar1<CR>')
        vim.keymap.set('n', '<leader>L', '<cmd>HopLine<CR>')
        vim.keymap.set('n', '<leader>w', '<cmd>HopWord<CR>')
        vim.keymap.set('n', '<leader>W', '<cmd>HopPattern<CR>')
    end
}
