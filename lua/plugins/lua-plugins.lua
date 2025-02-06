---@type LazySpec
return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    -- git相关
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    -- 文件/关键字 搜索
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
    end,
  },
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
  },
}
