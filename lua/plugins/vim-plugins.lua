---@type LazySpec
return {
  {
    'preservim/nerdtree',
    init = function()
      vim.cmd [[
      let NERDTreeChDirMode = 2
      nnoremap <Leader>e <Esc>:<C-U>NERDTree
      nnoremap <silent> <Leader>ef <Esc>:<C-U>NERDTreeFind<CR>
      nnoremap <silent> <Leader>ee <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeFocus<CR>
      nnoremap <silent> <Leader>et <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeToggle<CR>
      nnoremap <silent> <Leader>ev <Esc>:<C-U>NERDTree $MYVIMDIR<CR>
      nnoremap <silent> <Leader>eh <Esc>:<C-U>NERDTree $HOME<CR>
      ]]
    end,
  },
  { 'Xuyuanp/nerdtree-git-plugin', dependencies = 'preservim/nerdtree' },
  { 'ryanoasis/vim-devicons',      dependencies = 'Xuyuanp/nerdtree-git-plugin' },
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
  { 'ZSaberLv0/vim-easymotion-chs',   dependencies = 'easymotion/vim-easymotion' },
  { 'tpope/vim-surround',             dependencies = 'tpope/vim-repeat' },
  { 'tpope/vim-commentary',           dependencies = 'tpope/vim-repeat' },
  'vim-scripts/ReplaceWithRegister' ,
  'tommcdo/vim-exchange' ,
  { 'kana/vim-textobj-entire',        dependencies = 'kana/vim-textobj-user' },
  {
    'machakann/vim-highlightedyank',
    init = function()
      vim.cmd[[
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
  {
    'mattn/emmet-vim',
    init = function()
      vim.cmd [[
      " 使用<Tab>键
      let g:user_emmet_expandabbr_key = '<Tab>'
      " 按文件加载
      let g:user_emmet_install_global = 0
      autocmd FileType xml,html,jsx,tsx,css,sass,less EmmetInstall
      ]]
    end,
  },
  'tpope/vim-fugitive' ,
  'tommcdo/vim-exchange' ,
  'yianwillis/vimcdoc' ,
  {
    'unblevable/quick-scope',
    init = function()
      vim.cmd [[
      let g:qs_highlight_on_keys = ['f', 'F']
      onoremap f f
      onoremap F F
      ]]
    end,
  },
  {
    'vim-airline/vim-airline',
    init = function()
      vim.cmd [[
      " 兼容fern
      let g:airline#extensions#fern#enabled = 0
      " 只有一个tab时 显示buffers
      let g:airline#extensions#tabline#enabled = 1
      " 标题显示 最简的(包+文件名)
      let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
      ]]
    end,
    config = function()
      vim.cmd [[
      " 兼容fern
      let g:airline#extensions#fern#enabled = 0
      " 只有一个tab时 显示buffers
      let g:airline#extensions#tabline#enabled = 1
      " 标题显示 最简的(包+文件名)
      let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
      ]]
    end,
  },
  { 'vim-airline/vim-airline-themes', dependencies = 'vim-airline/vim-airline' },
  {
    'mhinz/vim-startify',
    init = function()
      vim.cmd [[
      let g:startify_custom_header = ['']
      let g:startify_lists= [
      \ {'type': 'commands' },
      \ {'type': 'files',     'header': [' MRU'],            },
      \ {'type': 'sessions',  'header':[]},
      \ {'type': 'bookmarks', 'header': [' Bookmarks']       },
      \ ]
      let g:startify_files_number = 9
      let g:startify_commands = [
      \ {'n': ['new Typed buffer: 输入文件类型',
      \        'enew | execute "set filetype=".input("filetype=")']},
      \ {'p': ['new Pasted buffer: 粘贴剪切板内容',
      \        'enew | execute "normal i\<S-Insert>\<Esc>"']},
      \ {'v': ['edit Vimrc: '.substitute(g:vimrc_home.'/init.vim', '\\', '/', 'g'),
      \        'e '.g:vimrc_home.'/init.vim']},
      \ ]
      if has('gui_running')
        let g:startify_commands += [
        \ {'b': ['font bigger: 调大字体', 'GuiFontBigger']},
        \ {'s': ['font smaller: 调小字体', 'GuiFontSmaller']},
        \ {'f': ['full screen: 全屏', 'GuiFullScreen']},
        \ ]
        endif
        ]]
    end
  },
}
