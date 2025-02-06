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
  },
  {
    'morhetz/gruvbox',
  },
  {
    'altercation/vim-colors-solarized',
  },
  {
    'projekt0n/github-nvim-theme',
  },
  {
    'xiantang/darcula-dark.nvim',
  },
}
