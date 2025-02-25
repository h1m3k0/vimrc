---@type LazySpec
return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    lazy = false,
    config = function(_, opts)
      require('nvim-tree').setup(opts)
      vim.keymap.set('n', '<Leader>e', '<Esc>:<C-U>NvimTree')
      vim.keymap.set('n', '<Leader>ev', '<CMD>NvimTreeOpen $MYVIMDIR<CR>')
      vim.keymap.set('n', '<Leader>ef', '<CMD>NvimTreeFindFile<CR>')
    end,
  },
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
      -- 定义最大长度（如30字符）
      local max_length = 10

      -- 保存原始处理器
      local original_inlay_hint_handler = vim.lsp.handlers['textDocument/inlayHint']

      -- 自定义处理器：截断超长文本并添加省略号
      vim.lsp.handlers['textDocument/inlayHint'] = function(err, result, ctx, config)
        if result then
          for _, hint in ipairs(result) do
            -- 处理字符串类型的 label
            if type(hint.label) == "string" then
              if #hint.label > max_length then
                hint.label = hint.label:sub(1, max_length) .. "..."
              end
              -- 处理数组类型的 label（如组合类型）
            elseif type(hint.label) == "table" then
              local count = 0
              for i, part in ipairs(hint.label) do
                if count > max_length then
                  part.value = ''
                elseif part.value then
                  if #part.value + count > max_length then
                    part.value = part.value:sub(1, max_length - count) .. "..."
                  end
                  count = #part.value + count
                end
              end
            end
          end
        end
        -- 调用原始处理器显示修改后的结果
        original_inlay_hint_handler(err, result, ctx, config)
      end

      require('lspconfig')['ts_ls'].setup {
        on_attach = function(client, bufnr)
          -- 启用当前缓冲区的 Inlay Hints
          vim.lsp.inlay_hint.enable(true)
        end,
        settings = {

                  completions = {
      completeFunctionCalls = true, -- 自动补全函数调用
    },
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",       -- 参数名提示
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true, -- 函数参数类型
              includeInlayVariableTypeHints = true,          -- 变量类型
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true, -- 函数返回类型
              includeInlayEnumMemberValueHints = true,        -- 枚举值
            },
                  suggest = {
        jsx = {
          autoClosingTags = true,
          attributeCompletions = true,
        }
      }
          },
          javascript = {
            inlayHints = {
              -- 同上，为 JavaScript 配置相同的选项
            },
          },
        },
      }
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
        ['ts_ls'] = function()
        end,
      }
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    event = 'VeryLazy',
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
    'folke/snacks.nvim',
    priority = 999,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        preset = {
          header = [[]],
        },
      },
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
