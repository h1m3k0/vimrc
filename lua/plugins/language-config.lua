---@type LazySpec
return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', },
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
      vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename)
      vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
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
        ['jdtls'] = function()
        end,
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
  {
    import = 'plugins/languages'
  }
}
