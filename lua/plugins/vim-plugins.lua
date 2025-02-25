---@type LazySpec
return {
  {
    'easymotion/vim-easymotion',

    init = function()
      vim.cmd [[
      " 智能大小写
      let g:EasyMotion_smartcase = 1
      " 禁用默认映射
      let g:EasyMotion_do_mapping = 0
      map  <Leader>f  <Plug>(easymotion-bd-f)
      map  <Leader>F  <Plug>(easymotion-bd-f)
      map  <Leader>t  <Plug>(easymotion-bd-t)
      map  <Leader>T  <Plug>(easymotion-bd-t)
      ]]
    end,
  },
  { 'ZSaberLv0/vim-easymotion-chs',  dependencies = 'easymotion/vim-easymotion' },
  { 'tpope/vim-surround',            dependencies = 'tpope/vim-repeat' },
  'vim-scripts/ReplaceWithRegister',
  'tommcdo/vim-exchange',
  { 'kana/vim-textobj-entire',       dependencies = 'kana/vim-textobj-user' },
  {
    'machakann/vim-highlightedyank',
    init = function()
      vim.cmd [[
      let g:highlightedyank_highlight_duration = 2000
      ]]
    end,
  },
  { 'michaeljsmith/vim-indent-object', dependencies = 'kana/vim-textobj-user' },
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd [[
      nmap  ga  <Plug>(EasyAlign)
      xmap  ga  <Plug>(EasyAlign)
      ]]
    end,
  },
  'tpope/vim-fugitive',
  'tommcdo/vim-exchange',
  'yianwillis/vimcdoc',
}
