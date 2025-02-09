return {
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
}
