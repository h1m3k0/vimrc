return {
  { 
    'folke/flash.nvim',
    config=true,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    -- git相关
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    -- 文件/关键字 搜索
    'nvim-telescope/telescope.nvim',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'echasnovski/mini.nvim'
  },
  {
    -- 安装lsp
    'williamboman/mason.nvim',
    config = true,
  },
  {
    -- lsp配置?
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').jdtls.setup{}
      require('lspconfig').rust_analyzer.setup{}
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'Saghen/blink.cmp',
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' }
  },
  {
    'Saghen/blink.cmp',
    version = '*',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { "sources.default" },
  },
  { 'mfussenegger/nvim-lint' },
  { 'stevearc/conform.nvim' },
  -- { 
    --   'hrsh7th/nvim-cmp',
    --   config = function()
      --     require('cmp_nvim_lsp').default_capabilities()
      --     require('cmp').setup{}
      --   end,
      --   dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp' },
      -- }
      -- {
        --   'mfussenegger/nvim-jdtls',
        --   opts = {
          --     cmd = {'C:/Users/lxp/AppData/Local/nvim-data/mason/packages/jdtls/bin'}
          --   },
          --   config = function(_, opts)
            --     require('jdtls').start_or_attach(opts)
            --   end,
            -- }
        }
