local ll_theme = function()
    local colors = {
        transparent	= nil,
        darkblue  	= '#242b5e',
        orange     	= '#ffb86c',
        purple     	= '#b66af7',
        red        	= '#ff5555',
        yellow     	= '#f1fa8c',
        blue       	= '#9382f5',
        white      	= '#f8f8f2',
        black      	= '#171924',
    }

    return {
        normal = {
            a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
        insert = {
            a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
        visual = {
            a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
        replace = {
            a = { bg = colors.red, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
        command = {
            a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
        inactive = {
            a = { bg = colors.darkblue, fg = colors.white, gui = 'bold' },
            b = { bg = colors.darkblue, fg = colors.white },
            c = { bg = colors.transparent, fg = colors.white },
        },
    }
end

local undotree_extension = {
    sections = {
        lualine_a = {
            function()
                local filetype = vim.opt_local.filetype:get()
                return (filetype == 'undotree') and 'Undo Tree' or (filetype == 'undotreeDiff') and 'Undotree Diff'
            end
        },
        lualine_z = { 'location' }
    },
    filetypes = { "undotree", "undotreeDiff" }
}

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = ll_theme,
        component_separators = { left = '',--[[  right = '🗿'},-- ]] right = '│'},
        -- component_separators = { left = '', right = '' },
        section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 300,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', draw_empty = true }, {
            'diff',
            diff_color = {
                removed = { fg = '#e37171' },
                added = { fg = "#49ad5d" },
                modified = { fg = "#ba8832" }
            }
        } },
        lualine_c = {
            {'diagnostics', sources = { "nvim_lsp" } },
            {'filename',
                symbols = {
                    modified = '',
                    -- readonly = '🗿',
                    readonly = '',
                    alternate_file = '#',
                    directory =  '',
                },
                path = 1,
            }
        },
        lualine_x = {'filetype', 'encoding', 'fileformat'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            {'filename',
                symbols = {
                    modified = '',
                    -- readonly = '🗿',
                    readonly = '',
                }
            }
        },
        lualine_c = {},
        lualine_x = {'filetype'},
        lualine_y = {'location'},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    --lualine_b = {{"filename", path = 1}}
    --},
    inactive_winbar = {},
    extensions = { 'neo-tree', 'trouble', undotree_extension }
})

