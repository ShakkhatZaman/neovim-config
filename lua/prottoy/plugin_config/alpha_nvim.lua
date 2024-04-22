local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {

    "     █████ █     ██                           █████ █      ██                           ",
    "   ██████  ██    ████ █                     ██████  █     ████   ▄█▄                    ",
    "  ██   █  █▀██    ████▀                    ██   █  █▀      █████ ███                    ",
    " █▀   █▀ █▀ ██    █ █                     █▀   █▀ ██       █ ██   █                     ",
    "     █▀ █▀   ██   █                ███        █▀ ███      █▀  █                         ",
    "    ██ ██    ██   █      ███      █▀███ ▄█   ██   ██      █      ███    ███ ████ ███    ",
    "    ██ ██     ██  █     █▀███    █▀  ████    ██   ██      █       ███    ███▀████▀███ ▄█",
    "    ██ ██     ██  █    █▀  ███  ██    ██     ██   ██     █▀        ██     ██  ███  ████ ",
    "    ██ ██      ██ █   ██    ███ ██    ██     ██   ██     █         ██     ██   ██   ██  ",
    "    ██ ██      ██ █   ████████  ██    ██     ██   ██     █         ██     ██   ██   ██  ",
    "   ▄█  ██       ███   ███████   ██    ██      ██  ██    █▀         ██     ██   ██   ██  ",
    "      ▄█        ███   ██        ██▄  ▄██       ██ █     █          ██     ██   ██   ██  ",
    "   ████▀         ██   ████   ▄█  ██████         ███▄   ██          ██     ██   ██   ██  ",
    "  █▀ █████             ███████▀   ████           ███████▀          ███ █  ███  ███  ███ ",
    " █▀    ██               █████                     ███              ███▀   ███  ███  ███ ",
    " █                                                                                      ",
    "  █                                                                                     ",
    "   ██                                                                                   ",

    --[[ "   ▄█▄          █▄                                                          ",
    " ▄████▄         ███▄                                                        ",
    "████████        █████                                                       ",
    "█████████▄      █████                                                       ",
    "█████▀████▄     █████                                                       ",
    "█████  █████    █████                                 ▄▄                    ",
    "█████   ▀████▄  █████                  ▀████▀   ▀███▀ ██                    ",
    "█████    ▀████▄ █████                    ▀██     ▄█                         ",
    "█████      ██████████   ▄▄█▀█▄   ▄██▀██▄  ██▄   ▄█  ▀███  ▀████████▄█████▄  ",
    "█████       ▀████████  ▄█▀   ██ ██▀   ▀██  ██▄  █▀    ██    ██    ██    ██  ",
    "▀████        ▀██████▀  ██▀▀▀▀▀▀ ██     ██  ▀██ █▀     ██    ██    ██    ██  ",
    "  ▀██          ███▀    ██▄    ▄█ █▄   ▄██   ▄██▄      ██    ██    ██    ██  ",
    "    ▀           ▀       ▀█████▀  ▀█████▀     ██     ▄████▄ ████  ████  ████▄", ]]
}
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e",  "  New file" , ":ene<CR>"),
    dashboard.button( "f",  "  Find file", ":Telescope find_files<CR>"),
    dashboard.button( "o",  "  Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s",  "  Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q",  "󰗼  Quit NeoVIM", ":qa<CR>"),
    dashboard.button( "t",  "  Terminal", ":ToggleTerm<CR>"),
    dashboard.button( "F",  "󰙅  File tree", ":Neotree<CR>"),
}

local config = {
    layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        dashboard.section.footer,
    },
    opts = {
        margin = 5,
    },
}

alpha.setup(config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd User AlphaReady set showtabline=0
]])
--autocmd FileType alpha setlocal nofoldenable
