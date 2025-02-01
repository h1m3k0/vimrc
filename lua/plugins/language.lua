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
      install_root_dir = vim.env.MYVIMDIR .. '/local/mason',
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
    'nvim-treesitter/nvim-treesitter',
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset     = 'none',
        ['<CR>']   = { 'accept', 'fallback' },
        ['<Tab>']  = { 'snippet_forward', 'select_and_accept', 'fallback' },
        ['<Up>']   = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-P>']  = { 'select_prev', 'fallback' },
        ['<C-N>']  = { 'select_next', 'fallback' },
        ['<C-b>']  = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']  = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
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
    opts_extend = { "sources.default" },
  },
  { 'mfussenegger/nvim-lint' },
  { 'stevearc/conform.nvim' },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {},
  },
}
