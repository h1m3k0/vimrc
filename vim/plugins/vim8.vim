if v:version < 800
    finish
endif

Plug 'yianwillis/vimcdoc' " 中文文档 {{{2

Plug 'LunarWatcher/auto-pairs' " 自动括号 {{{2
    " 右边为非空字符时不自动添加括号
    let g:AutoPairsCompleteOnlyOnSpace = 1
Plug 'chrisbra/matchit' " => 匹配 {{{2
    nmap M %
    xmap M %
    omap M %
Plug 'mg979/vim-visual-multi' " 多光标 {{{2
    let g:VM_maps                    = {}
    " 增强VM的撤销(原生undo会有问题)
    let g:VM_maps['Undo']            = 'u'
    " 增强VM的撤销(原生redo会有问题)
    let g:VM_maps['Redo']            = '<C-r>'
    " 单词
    let g:VM_maps['Find Under']      = '<A-n>'
    " 字符
    let g:VM_maps['Add Cursor Down'] = '<A-Down>'
    " 字符
    let g:VM_maps['Add Cursor Up']   = '<A-Up>'
    let g:VM_maps['Mouse Cursor']    = '<A-LeftMouse>'
    let g:VM_maps['Mouse Word']      = '<A-RightMouse>'
    let g:VM_maps['Switch Mode']     = '<Tab>'

Plug 'skywind3000/asyncrun.vim'  " 将特定命令绑定映射时用到 {{{2
Plug 'skywind3000/asynctasks.vim'
    if has('win32')
        " windows系统使用GBK
        let g:asyncrun_encs = 'gbk'
    endif
    " 自动打开copen
    let g:asyncrun_open = 6
