---@type LazySpec
return {
  {
    'nvim-neorg/neorg',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
          icon_preset = 'varied',
        },
      }
    }
  },
  {
    'mfussenegger/nvim-lint', version = '*',
  },
  {
    'stevearc/conform.nvim', version = '*',
  },
  {
    -- git相关
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = true,
  },
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '*',
    event = 'VeryLazy',
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        globalstatus = true,
      },
    },
  },
  {
    'folke/snacks.nvim',
    priority = 999,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bufdelete = {},
      input = {},
      picker = {},
      dashboard = {
        preset = {
          header = [[]],
        },
      },
    },
  },
}
