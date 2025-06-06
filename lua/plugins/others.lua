---@type LazySpec
return {
    {
        'mfussenegger/nvim-lint', version = '*',
    },
    {
        'stevearc/conform.nvim', version = '*',
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
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
        event = 'VeryLazy',
        opts = {
            cmdline = {
                enabled = false,
            },
            messages = {
                enabled = false,
            },
            notify = {
                enabled = false,
            },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },
            },
        },
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'ryanoasis/vim-devicons',
        version = '*',
        event = 'VeryLazy',
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'ryanoasis/vim-devicons' },
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
        'NStefan002/screenkey.nvim',
        lazy = false,
        version = '*',
    },
    {
        'folke/snacks.nvim',
        priority = 999,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bufdelete = {},
            input = {},
            picker = {},
            dashboard = {
                preset = {
                    header = [[]],
                },
            },
        },
    },
}
