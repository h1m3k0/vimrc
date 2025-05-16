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
      map  <Leader><Leader>f  <Plug>(easymotion-bd-f)
      map  <Leader><Leader>F  <Plug>(easymotion-bd-f)
      map  <Leader><Leader>t  <Plug>(easymotion-bd-t)
      map  <Leader><Leader>T  <Plug>(easymotion-bd-t)
      ]]
    end,
  },
  { 'ZSaberLv0/vim-easymotion-chs',  dependencies = 'easymotion/vim-easymotion' },
  { 'tpope/vim-surround',            dependencies = 'tpope/vim-repeat' },
  {
    'vim-scripts/ReplaceWithRegister',
    init = function()
      vim.keymap.del('n', 'gri')
      vim.keymap.del({'n','x'} , 'gra')
      vim.keymap.del('n', 'grn')
    end
  },
  'tommcdo/vim-exchange',
  { 'kana/vim-textobj-entire',       dependencies = 'kana/vim-textobj-user' },
  {
      'vim-scripts/argtextobj.vim',
      dependencies = 'kana/vim-textobj-user',
      init = function()
         vim.cmd [[
         let g:argtextobj_pairs = '(:),{:},[:],<:>'
         ]]
      end,
  },
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
  'mattn/emmet-vim',
  {
    'kana/vim-arpeggio',
    config = function()
      vim.cmd [[
        Arpeggio inoremap jk <Esc>
        Arpeggio nnoremap io  :
      ]]
    end
  }
}
