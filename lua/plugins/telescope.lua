---@type LazySpec
return {
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
}
