-- Setting Leaderkey
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

--  Tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber= true
vim.opt.wrap = false
vim.api.nvim_set_hl(0, 'LineNr', {fg = "#7022a1"})

-- Searching
vim .opt.incsearch = true

--Scrolling
vim.opt.scrolloff = 10
-- vim.opt.signcolumn = "yes"

vim.o.shell = "powershell.exe"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Other
vim.opt.updatetime = 50

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.vert", "*.frag", "*.tesc", "*.tese", "*.geom", "*.comp"},
    command = "set filetype=glsl"
})

