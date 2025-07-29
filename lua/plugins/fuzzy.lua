---@type LazySpec
return {
    {
        'nvim-telescope/telescope.nvim',
        cond = true,
        dependencies = {
            {
                'nvim-telescope/telescope-ui-select.nvim',
                dependencies = 'nvim-telescope/telescope.nvim',
                config = function(_, opts)
                    vim.schedule(function()
                        require('telescope').load_extension('ui-select')
                    end)
                end
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            local builtin = require('telescope.builtin')
            telescope.setup({
                defaults = {
                    layout_strategy = 'vertical',
                    layout_config = {
                        width = 0.999,
                        height = 0.999,
                    },
                    borderchars = {
                                  { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                        prompt =  { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                    },
                    mappings = {
                        i = {
                            ['<Esc>'] = actions.close,
                            ['<C-U>'] = false,
                        },
                    },
                },
            })
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
            vim.keymap.set('n', 'gR', builtin.lsp_references)
            vim.keymap.set('n', 'gd', builtin.lsp_definitions)
            vim.keymap.set('n', 'gy', builtin.lsp_type_definitions)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
            vim.keymap.set('n', 'gI', builtin.lsp_implementations)
            vim.keymap.set('n', '<Leader>i', vim.lsp.buf.code_action)

            vim.keymap.set('n', '<Leader>f<Space>', '<Esc>:<C-U>Telescope ')
        end,
    },
    {
        'ibhagwan/fzf-lua',
        cond = true,
        opts = {
            fzf_bin = vim.g.vimdir .. '/plugged/fzf/bin/fzf',
            winopts = {
                fullscreen = true,
                preview = {
                    layout = 'vertical',
                    vertical = 'up'
                },
            },
        },
        config = function(_, opts)
            if true then return end
            require('fzf-lua').setup(opts)
            local fzf = require('fzf-lua')
            vim.keymap.set('n', 'gR', fzf.lsp_references)
            vim.keymap.set('n', 'gd', fzf.lsp_definitions)
            vim.keymap.set('n', 'gy', fzf.lsp_typedefs)
            vim.keymap.set('n', 'gD', fzf.lsp_declarations)
            vim.keymap.set('n', 'gI', fzf.lsp_implementations)
            fzf.register_ui_select()
            vim.keymap.set('n', '<Leader>i', fzf.lsp_code_actions)
            vim.keymap.set({'n', 'v'}, '<Leader>ff', fzf.files)
            vim.keymap.set('n', '<Leader>fF', fzf.git_files)
            vim.keymap.set('n', '<Leader>fg', fzf.live_grep)
            vim.keymap.set('n', '<Leader>fG', function()
                fzf.live_grep { search_paths = fzf.path.git_root {} }
            end)
            vim.keymap.set('n', '<Leader>f<Space>', '<Esc>:<C-U>FzfLua ')
        end,

    }
}
