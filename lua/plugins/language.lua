return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    opts = {
    },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- require('lspconfig').language_server.setup({})
    end,
  },
  {
    -- 安装lsp
    'williamboman/mason.nvim',
    opts = {
      install_root_dir = vim.fn.getenv('MYVIMDIR') .. '/local/mason',
    },
  },
  { 
    'williamboman/mason-lspconfig.nvim',
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
            auto_insert = true,
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" },
  },
  { 'mfussenegger/nvim-lint' },
  { 'stevearc/conform.nvim' },
}
