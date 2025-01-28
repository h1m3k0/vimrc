local noremap = function(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc,
  }
end
local map = function(desc)
  return {
    noremap = false,
    silent = true,
    desc = desc,
  }
end

return {
  {
    'yianwillis/vimcdoc',
    event = 'VeryLazy',
  },
  {
    'easymotion/vim-easymotion',
    init = function() 
      -- 智能大小写
      vim.g.EasyMotion_smartcase = 1
      -- 禁用默认映射
      vim.g.EasyMotion_do_mapping = 0
    end,
    config = function()
      vim.keymap.set({'n','x','o'}, '<Leader>f', '<Plug>(easymotion-bd-f)', map('EasyMotion-f'))
      vim.keymap.set({'n','x','o'}, '<Leader>F', '<Plug>(easymotion-bd-F)', map('EasyMotion-F'))
      vim.keymap.set({'n','x','o'}, '<Leader>t', '<Plug>(easymotion-bd-t)', map('EasyMotion-t'))
      vim.keymap.set({'n','x','o'}, '<Leader>T', '<Plug>(easymotion-bd-T)', map('EasyMotion-T'))
    end,
  },
  {
    'ZSaberLv0/vim-easymotion-chs', 
    dependencies = { 'easymotion/vim-easymotion' },
  },
  {
    'tpope/vim-surround',
    dependencies = { 'tpope/vim-repeat' },
  },
  {
    'mg979/vim-visual-multi',
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
  { 'tpope/vim-commentary' },
  { 'vim-scripts/ReplaceWithRegister' },
  { 'tommcdo/vim-exchange' },
  { 
    'kana/vim-textobj-entire',
    dependencies = { 'kana/vim-textobj-user' },
  },
  {
    'machakann/vim-highlightedyank',
    init = function()
      vim.g.highlightedyank_highlight_duration = 2000
    end,
  },
  { 'dbakker/vim-paragraph-motion' },
  { 
    'michaeljsmith/vim-indent-object',
    dependencies = { 'kana/vim-textobj-user' },
  },
  {
    'chrisbra/matchit',
    config = function()
      vim.keymap.set({'n','x','o'}, 'M', '%')
    end,
  },
  { 'wellle/targets.vim' },
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.keymap.set({'n','x','o'}, 'ga', '<Plug>(EasyAlign)', map('EasyAlign'))
    end,
  },
}
