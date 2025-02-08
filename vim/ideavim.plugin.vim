

" 快速跳转 [motions] 
Plug 'easymotion/vim-easymotion'
execute 'source '.g:MYVIMDIR.'/vim/plugins/vim-easymotion.vim'
" Plug 'justinmk/vim-sneak'
" 文件树
Plug 'preservim/nerdtree'
execute 'source '.g:MYVIMDIR.'/vim/plugins/nerdtree.vim'
" 环绕操作 [operator] (y/c/d)s
Plug 'tpope/vim-surround'
" 多光标
Plug 'terryma/vim-multiple-cursors'
execute 'source '.g:MYVIMDIR.'/vim/plugins/vim-multiple-cursors.vim'
" 注释操作 [operator] gc
Plug 'tpope/vim-commentary'
" 替换操作 [operator] gr
Plug 'vim-scripts/ReplaceWithRegister'
" 参数文本对象 [text-objects] (i/a)a
Plug 'vim-scripts/argtextobj.vim'
execute 'source '.g:MYVIMDIR.'/vim/plugins/argtextobj.vim.vim'
" 互换操作 [operator] cx
Plug 'tommcdo/vim-exchange'
" 全文文本对象 [text-objects] (i/a)e
Plug 'kana/vim-textobj-entire'
" 复制高亮
Plug 'machakann/vim-highlightedyank'
execute 'source '.g:MYVIMDIR.'/vim/plugins/vim-highlightedyank.vim'
" 大括号增强 (只含有空格的行)
Plug 'dbakker/vim-paragraph-motion'
" 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下
Plug 'michaeljsmith/vim-indent-object'
" 百分号增强 (自定义匹配内容, IdeaVim中默认可匹配 HTML标签/if-else 等)
Plug 'chrisbra/matchit'
execute 'source '.g:MYVIMDIR.'/vim/plugins/matchit.vim'

" 后面的需要单独安装idea插件

" 高亮f/t的跳转
execute 'source '.g:MYVIMDIR.'/vim/plugins/quick-scope.vim'
" 实时显示组合键
" set which-key
" 显示寄存器
set peekaboo
" 方法文本对象 if af
set functiontextobj
