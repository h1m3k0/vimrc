---@type LazySpec
return {
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('everforest')
            vim.o.background = 'dark'
            vim.cmd('highlight! TermCursor gui=reverse')
        end,
    },
    'joshdick/onedark.vim',
    'sainnhe/gruvbox-material',
    'altercation/vim-colors-solarized',
    { 'catppuccin/nvim', name = 'catppuccin' },
    'Mofiqul/vscode.nvim',
}
