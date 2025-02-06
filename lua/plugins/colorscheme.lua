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
  {
    'joshdick/onedark.vim',
    event = 'VeryLazy',
  },
  {
    'morhetz/gruvbox',
    event = 'VeryLazy',
  },
  {
    'altercation/vim-colors-solarized',
    event = 'VeryLazy',
  },
  {
    'projekt0n/github-nvim-theme',
    event = 'VeryLazy',
  },
  {
    'xiantang/darcula-dark.nvim',
    event = 'VeryLazy',
  },
}
