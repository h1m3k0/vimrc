---@type LazySpec
return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', },
    event = 'VeryLazy',
    config = function()
    end,
  },
  {
    -- 安装lsp
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    opts = {
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    opts = {
      ensure_installed = { 'vimls', 'lua_ls' },
      automatic_installation = true,
      handlers = {
        function (server_name)
          require('lspconfig')[server_name].setup {}
        end,
        -- ['server_name'] = function()
        -- end,
      }
    },
  },
  {
    -- neovim和lazy的支持
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        'lazy.nvim',
        { path = '${3rd}/luv/library', word = { 'vim%.uv' } },
      },
      enabled = true,
    },
  },
}
