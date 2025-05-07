---@type LazySpec
return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    lazy = false,
    opts = {
      update_focused_file = {
        -- enable = true,
        update_cwd = true,
      },
    },
    config = function(_, opts)
      require('nvim-tree').setup(opts)
      local tree = require('nvim-tree.api').tree
      vim.keymap.set('n', '<Leader>e', '<Esc>:<C-U>NvimTree')
      vim.keymap.set('n', '<Leader>ev',function()
        tree.open({ path = vim.g.vimdir })
        tree.change_root(vim.g.vimdir)
      end)
      vim.keymap.set('n', '<Leader>ef', function()
        tree.find_file({ open = true, focus = true})
      end)
    end,
  },
}
