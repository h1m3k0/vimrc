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
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    config = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
    },
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },

  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = true,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim', },
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = true,
    dependencies = { 'nvim-tree/nvim-web-devicons', },
  },
  { 
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },
  { 
    'junegunn/vim-peekaboo',
    event = 'VeryLazy',
  },
}
