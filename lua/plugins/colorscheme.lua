---@type LazySpec
return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('everforest')
      vim.o.background = 'dark'
    end,
  },
  {
    'joshdick/onedark.vim',
    event = 'VeryLazy',
    config = function()
--       vim.cmd.colorscheme('onedark')
--       vim.o.background = 'dark'
    end,
  },
  {
    'morhetz/gruvbox',
    event = 'VeryLazy',
    config = function()
--       vim.cmd.colorscheme('gruvbox')
--       vim.o.background = 'light'
    end,
  },
  {
    'altercation/vim-colors-solarized',
    event = 'VeryLazy',
    config = function()
--       vim.cmd.colorscheme('solarized')
--       vim.o.background = 'light'
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    event = 'VeryLazy',
    config = function()
--       vim.cmd.colorscheme('github_light')
--       vim.o.background = 'light'
    end,
  },
  {
    'catppuccin/nvim', name = 'catppuccin',
    event = 'VeryLazy',
    config = function()
--       vim.cmd.colorscheme('catppuccin')
--       vim.o.background = 'dark'
    end,
  }
}
