require('lspconfig').vtsls.setup {
  on_attach = function(client, bufnr)
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
