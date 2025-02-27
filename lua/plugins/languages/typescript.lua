local inlayHints = {
  parameterNames = {
    enabled = 'literals',
    suppressWhenArgumentMatchesNames = true,
  },
  parameterTypes = {
    enabled = true,
    suppressWhenTypeMatchesNames = true,
  },
  propertyDeclarationTypes = {
    enabled = true,
  },
  functionLikeReturnTypes = {
    enabled = true,
  },
  enumMemberValues = {
    enabled = true,
  },
}
require('lspconfig').vtsls.setup {
  on_attach = function()
  end,
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    },
  },
}
-- require('lspconfig').ts_ls.setup {}
