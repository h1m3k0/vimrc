return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', },
    config = function()
    end,
  },
  {
    -- 安装lsp
    'williamboman/mason.nvim',
    opts = {
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
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
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset      = 'none',
        ['<CR>']    = { 'accept', 'fallback' },
        ['<Tab>']   = { 'snippet_forward', 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<Up>']    = { 'select_prev', 'fallback' },
        ['<Down>']  = { 'select_next', 'fallback' },
        ['<C-P>']   = { 'select_prev', 'fallback' },
        ['<C-N>']   = { 'select_next', 'fallback' },
        ['<C-B>']   = { 'scroll_documentation_up', 'fallback' },
        ['<C-F>']   = { 'scroll_documentation_down', 'fallback' },
        cmdline = {
          preset      = 'none',
          ['<Tab>']   = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<C-P>']   = { 'select_prev', 'fallback' },
          ['<C-N>']   = { 'select_next', 'fallback' },
        },
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
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  { 'mfussenegger/nvim-lint' },
  { 'stevearc/conform.nvim' },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
}
