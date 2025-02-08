---@type LazySpec
return {
  {
    'nvim-java/nvim-java',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mason/mason-lspconfig.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('java').setup({
        root_markers = {
          '.git',
        }
      })
      require('lspconfig').jdtls.setup({})
    end,
  }
}
