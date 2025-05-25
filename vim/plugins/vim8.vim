if v:version < 800
  finish
endif

Plug 'yianwillis/vimcdoc' " 中文文档 {{{2

Plug 'Xuyuanp/nerdtree-git-plugin' " => NERDTree+Git {{{2

Plug 'LunarWatcher/auto-pairs' " 自动括号 {{{2
  " 右边为非空字符时不自动添加括号
  let g:AutoPairsCompleteOnlyOnSpace = 1
Plug 'chrisbra/matchit' " => 匹配 {{{2
  nmap M %
  xmap M %
  omap M %
Plug 'mg979/vim-visual-multi' " 多光标 {{{2
  let g:VM_maps = {
        "\  增强VM的撤销(原生undo会有问题)
        \  'Undo': 'u',
        "\  增强VM的撤销(原生redo会有问题)
        \  'Redo': '<C-r>',
        "\  单词
        \  'Find Under':      '<A-n>',
        "\  字符
        \  'Add Cursor Down': '<A-Down>',
        "\  字符
        \  'Add Cursor Up':   '<A-Up>',
        "\  字符
        \  'Mouse Cursor':    '<A-LeftMouse>',
        "\  单词
        \  'Mouse Word':      '<A-RightMouse>',
        \  'Switch Mode':     '<Tab>',
        \ }

Plug 'skywind3000/asyncrun.vim'  " 将特定命令绑定映射时用到 {{{2
  if has('win32')
    " windows系统使用GBK
    let g:asyncrun_encs = 'gbk'
  endif
  " 自动打开copen
  let g:asyncrun_open = 6