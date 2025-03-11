---@type LazySpec
return {
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
        enabled = false,
        keymap = {
          preset      = 'none',
          ['<Tab>']   = {
            function(cmp)
              if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
            end,
            'show_and_insert',
            'select_next',
          },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<Down>']  = { 'select_next', 'fallback' },
          ['<Up>']    = { 'select_prev', 'fallback' },
          ['<C-N>']   = { 'select_next', 'fallback' },
          ['<C-P>']   = { 'select_prev', 'fallback' },
          -- 退格和空格的同时隐藏
          ['<BS>']    = {
            function(cmp)
              cmp.hide() return false
            end,
            'fallback',
          },
          ['<Space>'] = {
            function(cmp)
              cmp.hide() return false
            end,
            'fallback',
          },
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
        use_nvim_cmp_as_default = false,
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
}
