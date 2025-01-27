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
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },
  { 'junegunn/vim-peekaboo' },
}
