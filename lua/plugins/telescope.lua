---@type LazySpec
return {
  {
    -- 文件/关键字 搜索
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', },
    version = '*',
    event = 'VeryLazy',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'gR', builtin.lsp_references)
      vim.keymap.set('n', 'gd', builtin.lsp_definitions)
      vim.keymap.set('n', 'gy', builtin.lsp_type_definitions)

      -- vim.keymap.set('n', 'gD', function()
      --   fzf.lsp_declarations({ ignore_current_line = true, jump_to_single_result = true })
      -- end)
      -- vim.keymap.set('n', 'gI', function()
      --   fzf.lsp_implementations({ ignore_current_line = true, jump_to_single_result = true })
      -- end)
      -- vim.keymap.set('n', '<Leader>ca', function()
      --   fzf.lsp_code_actions()
      -- end)

    end,
  },
}
