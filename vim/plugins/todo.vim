vim9script
Plug 'mg979/vim-visual-multi' # 多光标
g:VM_maps = {
    'Undo': 'u',     # 增强VM的撤销(原生undo会有问题)
    'Redo': '<C-r>', # 增强VM的撤销(原生redo会有问题)
    'Find Under':      '<A-n>',          # 单词
    'Add Cursor Down': '<A-Down>',       # 字符
    'Add Cursor Up':   '<A-Up>',         # 字符
    'Mouse Cursor':    '<A-LeftMouse>',  # 字符
    'Mouse Word':      '<A-RightMouse>', # 单词
    'Switch Mode':     '<Tab>',
}

# Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }


# Plug 'lambdalisue/vim-fern'



Plug 'skywind3000/asyncrun.vim'
  if has('win32')
    # windows系统使用GBK
    g:asyncrun_encs = 'gbk'
  endif
  # 自动打开copen
  g:asyncrun_open = 6
