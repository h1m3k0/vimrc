return {
  { 
    'folke/flash.nvim',
    config=true,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    -- git相关
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    -- 文件/关键字 搜索
    'nvim-telescope/telescope.nvim',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'echasnovski/mini.nvim'
  },
}
