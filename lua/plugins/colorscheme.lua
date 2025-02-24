---@type LazySpec
return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('everforest')
      vim.o.background = 'dark'
    end,
  },
  'joshdick/onedark.vim',
  'sainnhe/gruvbox-material',
  'altercation/vim-colors-solarized',
  { 'catppuccin/nvim', name = 'catppuccin' },
}
