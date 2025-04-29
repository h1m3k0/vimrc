-- 定义最大长度（如20字符）
local max_length = 20

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
        for _, part in ipairs(hint.label) do
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
---@type LazySpec
return {
  {
    -- lsp配置
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', },
    version = '*',
    config = function()
      vim.lsp.inlay_hint.enable(true)
      vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
      vim.keymap.set({'n','x'}, '<Leader>l', vim.lsp.buf.format)
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
      handlers = {
        function (server_name)
          require('lspconfig')[server_name].setup {}
        end,
        ['vtsls'] = function()
          vim.cmd.luafile(vim.g.vimdir .. '/lua/plugins/languages/typescript.lua')
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
    },
  },
}
