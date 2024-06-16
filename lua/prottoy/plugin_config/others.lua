-- Telescope
require("telescope").setup()

-- Indent blank line
-- require("ibl").setup({ indent = { char = '┊' } })

-- Comment
-- require("Comment").setup()

--Undotree lua
require('undotree').setup({ float_diff = false })

require('hlchunk').setup({
    indent = {
        enable = true,
        chars = {'│'}
    },
    chunk = {
        enable = true
    }
})
