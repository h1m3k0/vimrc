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
    'nvim-treesitter/nvim-treesitter',
    -- 需要安装c语言环境
    build = ':TSUpdate',
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buf)  -- 100KB以上的文件禁用
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {  -- 范围选取
        enable =  true,
        keymaps = {
          init_selection    = '<C-S>',
          node_incremental  = '<C-S>',
          scope_incremental = '<Tab>',
          node_decremental  = '<BS>',
        },
      },
    },
    config = function(_, opts)
      require'nvim-treesitter.configs'.setup(opts)
      -- 使用git下载
      require'nvim-treesitter.install'.prefer_git = true
      -- 将git地址从https改为ssh (非官方 不稳定)
      for _, setting in pairs(require'nvim-treesitter.parsers'.list) do
        setting.install_info.url = vim.fn.substitute(setting.install_info.url, 'https://github.com/', 'git@github.com:', 'g')
      end
    end,
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
        ['<C-B>']  = { 'scroll_documentation_up', 'fallback' },
        ['<C-F>']  = { 'scroll_documentation_down', 'fallback' },
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
