---@type LazySpec
return {
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
            ['/'] = 'none',  -- 普通搜索
            ['//'] = 'fuzzy_finder', -- fuzzy搜索
            ['.'] = 'root',  -- 切换根目录
            ['I'] = 'toggle_hidden',
          },
          fuzzy_finder_mappings = {
          },
        },
        group_empty_dirs = true,
      },
      buffers = {
        window = {
          mappings = {
            ['.'] = 'root',  -- 切换根目录
          },
        },
      },
      git_status = {
        window = {
          mappings = {},
        },
      },
      document_symbols = {
        window = {
          mappings = {
            ['/'] = 'none',  -- 普通搜索
            ['//'] = 'fuzzy_finder', -- fuzzy搜索
          },
        },
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
      vim.keymap.set('n', '<Leader>e', '<Esc>:<C-U>Neotree', { noremap = true } )
      vim.keymap.set('n', '<Leader>ee', '<CMD>Neotree<CR>', { noremap = true } )
      vim.keymap.set('n', '<Leader>ef', '<CMD>Neotree reveal<CR>', { noremap = true } )
      vim.keymap.set('n', '<Leader>ev', '<CMD>Neotree $MYVIMDIR<CR>', { noremap = true } )
    end,
  },
}
