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
vim.api.nvim_set_hl(0, 'LineNrAbove', {fg = "#7022a1"})
vim.api.nvim_set_hl(0, 'LineNrBelow', {fg = "#7022a1"})
vim.api.nvim_set_hl(0, 'LineNr', {fg = "#9046b3"})
vim.api.nvim_set_hl(0, 'Whitespace', {fg = "#6f779b"})
vim.api.nvim_set_hl(0, 'NeoTreeDimText', {fg = "#4d5889"})

-- Backups and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

--Listchars
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '󰧞'}

--Diagnostic signs
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ", [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶", [vim.diagnostic.severity.INFO] = " "
        },
    },
})

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Scrolling
vim.opt.scrolloff = 10

-- Shell
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();\
                        $PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;"
vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.opt.shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
vim.opt.shellxquote = ''
vim.opt.shellquote = ''

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Other
vim.opt.updatetime = 50

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.vert", "*.frag", "*.tesc", "*.tese", "*.geom", "*.comp"},
    command = "set filetype=glsl"
})
