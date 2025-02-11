---@type LazySpec
return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'ryanoasis/vim-devicons',
    version = '*',
    event = 'VeryLazy',
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'ryanoasis/vim-devicons' },
    event = 'VeryLazy',
    config = true,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
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
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },
}
