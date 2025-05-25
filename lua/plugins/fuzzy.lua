---@type LazySpec
return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function(_, opts)
            require('fzf-lua').setup(opts)
            local fzf = require('fzf-lua')
            vim.keymap.set('n', 'gR', fzf.lsp_references)
            vim.keymap.set('n', 'gd', fzf.lsp_definitions)
            vim.keymap.set('n', 'gy', fzf.lsp_typedefs)
            vim.keymap.set('n', 'gD', fzf.lsp_declarations)
            vim.keymap.set('n', 'gI', fzf.lsp_implementations)
            vim.keymap.set('n', '<Leader>i', fzf.lsp_code_actions)
            vim.keymap.set('n', '<Leader>ff', fzf.files)
            vim.keymap.set('n', '<Leader>fF', fzf.git_files)
            vim.keymap.set('n', '<Leader>fg', fzf.live_grep)
            vim.keymap.set('n', '<Leader>fG', function()
                fzf.live_grep { search_paths = fzf.path.git_root {} }
            end)
            vim.keymap.set('n', '<Leader>f<Space>', '<Esc>:<C-U>FzfLua ')
        end,

    }
}
