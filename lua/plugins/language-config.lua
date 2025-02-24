---@type LazySpec
return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', },
    version = '*',
    config = function()
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
      vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
      vim.keymap.set('n', '<Leader>i', vim.lsp.buf.code_action)
    end,
  },
  {
    -- 安装lsp
    'williamboman/mason.nvim',
    version = '*',
    opts = {
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    version = '*',
    opts = {
      ensure_installed = { 'vimls', 'lua_ls' },
      automatic_installation = true,
      handlers = {
        function (server_name)
          require('lspconfig')[server_name].setup {}
        end,
      }
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset      = 'none',
        ['<CR>']    = { 'accept', 'fallback' },
        ['<Tab>']   = { 'snippet_forward', 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<Down>']  = { 'select_next', 'fallback' },
        ['<Up>']    = { 'select_prev', 'fallback' },
        ['<C-N>']   = { 'select_next', 'fallback' },
        ['<C-P>']   = { 'select_prev', 'fallback' },
        ['<C-B>']   = { 'scroll_documentation_up', 'fallback' },
        ['<C-F>']   = { 'scroll_documentation_down', 'fallback' },
      },
      cmdline = {
        keymap = {
          preset      = 'none',
          ['<Down>']  = { 'select_next', 'fallback' },
          ['<Up>']    = { 'select_prev', 'fallback' },
          ['<Tab>']   = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<C-N>']   = { 'select_next', 'fallback' },
          ['<C-P>']   = { 'select_prev', 'fallback' },
        }
      },
      completion = {
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= 'cmdline'
              and not require('blink.cmp').snippet_active{ direction = 1 }
            end,
            auto_insert = function(ctx) return ctx.mode == 'cmdline' end,
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'mfussenegger/nvim-lint', version = '*',
  },
  {
    'stevearc/conform.nvim', version = '*',
  },
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
