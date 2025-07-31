---@type LazySpec
return {
    {
        'mfussenegger/nvim-lint', version = '*',
    },
    {
        'stevearc/conform.nvim', version = '*',
    },
    {
        'folke/trouble.nvim',
        opts = {},
    },
    {
        -- git相关
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            local git = require('gitsigns')
            git.setup()
            -- 跳转到上一个更改
            vim.keymap.set('n', '<F2>', function() git.nav_hunk('next') end)
            -- 跳转到下一个更改
            vim.keymap.set('n', '<S-F2>', function() git.nav_hunk('prev') end)
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        event = 'VeryLazy',
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                globalstatus = true,
            },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {

        },
    },
    {
        -- 实时显示按键
        {
            'NStefan002/screenkey.nvim',
            lazy = false,
            version = '*',
        },
        {
            'nvzone/showkeys',
            opts = {
                maxkeys = 15,
            },
        },
    },
    {
        'folke/snacks.nvim',
        priority = 999,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bufdelete = {},
            dashboard = {
                preset = {
                    header = [[]],
                },
            },
            input = {},
            picker = {
                win = {
                    input = {
                        keys = {
                            ['<Esc>'] = { 'close', mode = { 'i', 'n' } },
                            ['<C-U>'] = false,
                        },
                    },
                },
            },
        },
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            local minimap = require('mini.map')
            minimap.setup({
                symbols = {
                    encode = minimap.gen_encode_symbols.dot('4x2'),
                },
                window = {
                    width = 10,
                    winblend = 100,
                    show_integration_count = true,
                }
            })
            vim.keymap.set('n', '<Leader>mm', minimap.toggle)
        end
    },
    {
        'RRethy/vim-illuminate', -- 光标当前词高亮
    },
    {
        'lewis6991/satellite.nvim',
        opts = {}
    },
}
