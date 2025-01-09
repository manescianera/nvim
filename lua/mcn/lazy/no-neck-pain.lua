return {
    "shortcuts/no-neck-pain.nvim",
    version = "2.0.5",

    config = function()
        require("no-neck-pain").setup({
            -- debug = true,
            width = 120,
            autocmds = {
                -- enableOnVimEnter = true,
                skipEnteringNoNeckPainBuffer = true,
            },
            buffers = {
                scratchPad = {
                    enabled = false,
                },

            },
            integrations = {
                undotree = {
                    position = "left",
                    reopen = true,
                },
                NvimDAPUI = {
                    position = "right",
                    reopen = true,
                }
            }
        })
    end,
}
