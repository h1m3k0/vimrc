---@type LazySpec
return {
  {
    -- 文件/关键字 搜索
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', },
    version = '*',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'gR', builtin.lsp_references)
      vim.keymap.set('n', 'gd', builtin.lsp_definitions)
      vim.keymap.set('n', 'gy', builtin.lsp_type_definitions)
    end,
  },
}
