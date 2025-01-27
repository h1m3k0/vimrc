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
    'justinmk/vim-sneak',
    init = function()
      vim.g['sneak#f_reset']    = 1
      vim.g['sneak#t_reset']    = 1
      -- ignorecase & smartcase
      vim.g['sneak#use_ic_scs'] = 1
    end,
    config = function()
      vim.keymap.set({'n','x','o'}, 's', '<Plug>Sneak_s')
      vim.keymap.set({'n','x','o'}, 'S', '<Plug>Sneak_S')
    end,
  },
  {
    'preservim/nerdtree',
    init = function()
      -- 切换目录时自动切换vim根目录
      vim.g.NERDTreeChDirMode = 2
    end,
    config = function()
      vim.keymap.set('n', '<Leader>ee', '<Esc>:<C-U>NERDTree ', { noremap = true, desc = 'NERDTree' })
      vim.keymap.set('n', '<Leader>ef', '<CMD>NERDTreeFind<CR>', noremap('NERDTreeFind'))
      vim.keymap.set('n', '<Leader>et', '<CMD>NERDTreeToggle<CR>', noremap('NERDTreeToggle'))
    end,
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
  {
    'unblevable/quick-scope',
    enabled = false, -- 与vim-sneak冲突
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end,
    config = function()
      vim.keymap.set('o', 'f', 'f', { noremap = true })
      vim.keymap.set('o', 'F', 'F', { noremap = true })
      vim.keymap.set('o', 't', 't', { noremap = true })
      vim.keymap.set('o', 'T', 'T', { noremap = true })
    end,
  },
  { 
    'folke/which-key.nvim',
    event = 'VeryLazy',
  },
  { 'junegunn/vim-peekaboo' },
  { 'wellle/targets.vim' },
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.keymap.set({'n','x','o'}, 'ga', '<Plug>(EasyAlign)', map('EasyAlign'))
    end,
  },
}
