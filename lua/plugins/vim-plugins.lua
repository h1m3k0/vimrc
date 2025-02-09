---@type LazySpec 
return {
  {
    'yianwillis/vimcdoc',
    event = 'VeryLazy',
  },
  {
    'easymotion/vim-easymotion',
    event = 'VeryLazy',
    init = function()
      -- 智能大小写
      vim.g.EasyMotion_smartcase = 1
      -- 禁用默认映射
      vim.g.EasyMotion_do_mapping = 0
    end,
    config = function()
      vim.keymap.set({'n','x','o'}, '<Leader>f', '<Plug>(easymotion-bd-f)')
      vim.keymap.set({'n','x','o'}, '<Leader>F', '<Plug>(easymotion-bd-F)')
      vim.keymap.set({'n','x','o'}, '<Leader>t', '<Plug>(easymotion-bd-t)')
      vim.keymap.set({'n','x','o'}, '<Leader>T', '<Plug>(easymotion-bd-T)')
    end,
  },
  {
    'ZSaberLv0/vim-easymotion-chs',
    dependencies = { 'easymotion/vim-easymotion' },
    event = 'VeryLazy',
  },
  {
    'tpope/vim-surround',
    dependencies = { 'tpope/vim-repeat' },
    event = 'VeryLazy',
  },
  {
    'mg979/vim-visual-multi',
    event = 'VeryLazy',
    init = function()
      vim.g.VM_maps = {
        -- 这里的映射配置是大小写敏感的
        ['Find Under']         = '<A-n>',
        ['Find Subword Under'] = '<A-n>',
        ['Add Cursor Down']    = '<A-Down>',
        ['Add Cursor Up']      = '<A-Up>',
        ['Mouse Cursor']       = '<A-LeftMouse>',
        ['Mouse Word']         = '<A-RightMouse>',
      }
    end,
  },
  {
    'vim-scripts/ReplaceWithRegister',
    event = 'VeryLazy',
  },
  {
    'tommcdo/vim-exchange',
    event = 'VeryLazy',
  },
  {
    'kana/vim-textobj-entire',
    dependencies = { 'kana/vim-textobj-user' },
    event = 'VeryLazy',
  },
  {
    'machakann/vim-highlightedyank',
    event = 'VeryLazy',
    init = function()
      vim.g.highlightedyank_highlight_duration = 2000
    end,
  },
  {
    'michaeljsmith/vim-indent-object',
    dependencies = { 'kana/vim-textobj-user' },
    event = 'VeryLazy',
  },
  {
    'junegunn/vim-easy-align',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set({'n','x','o'}, 'ga', '<Plug>(EasyAlign)')
    end,
  },
  {
    'junegunn/vim-peekaboo',
    event = 'VeryLazy',
  },
}
