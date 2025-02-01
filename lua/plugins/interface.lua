return {
  {
    'neanias/everforest-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('everforest')
      vim.o.background = 'dark'
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = true,
  },
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    event = 'VeryLazy',
    opts = {
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim', },
    event = 'VeryLazy',
    init = function()
      vim.keymap.set('n', '<Leader>e', '<CMD>Neotree<CR>', { noremap = true } )
    end,
    opts = {
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
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
            -- gg0 但gg不生效
            vim.api.nvim_feedkeys('0', 'n', true)
          end
        end,
      }
    },
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
