---@type LazySpec
return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    lazy = false,
    enabled = false,
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
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim', },
    event = 'VeryLazy',
    -- /neo-tree.nvim/lua/neo-tree/defaults.lua
    opts = {
      window = {
        mappings = {
          ['o'] = 'open',
          ['oc'] = 'none', ['od'] = 'none', ['og'] = 'none', ['om'] = 'none',
          ['on'] = 'none', ['os'] = 'none', ['ot'] = 'none',
        },
      },
      filesystem = {
        window = {
          mappings = {
            ['<C-]>'] = 'root',  -- 切换根目录
            ['I'] = 'toggle_hidden',
          },
          fuzzy_finder_mappings = {
          },
        },
        group_empty_dirs = true,
      },
      commands = {
        root = function(state)  -- 切换根目录
          -- 判断当前是否为root节点
          if state.tree:get_node():get_id() == state.tree:get_nodes()[1]:get_id() then
            -- 是root, 将根目录设为上级目录
            state.commands.navigate_up(state)
          else
            -- 不是root, 将根目录切换为当前节点
            state.commands.set_root(state)
          end
        end,
      }
    },
    config = function(_, opts)
      require('neo-tree').setup(opts)
      vim.keymap.set('n', '<Leader>e ', '<Esc>:<C-U>Neotree ', { noremap = true } )
      vim.keymap.set('n', '<Leader>ee', '<CMD>Neotree<CR>', { noremap = true } )
      vim.keymap.set('n', '<Leader>ef', '<CMD>Neotree reveal_force_cwd<CR>', { noremap = true } )
      vim.keymap.set('n', '<Leader>ev', '<CMD>Neotree dir=' .. vim.g.vimdir ..'<CR>', { noremap = true } )
    end,
  },
}
