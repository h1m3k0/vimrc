source ~/vimfiles/vim/plugin/quick-scope.vim

Plug 'easymotion/vim-easymotion'        " 快速跳转 [motions]
" Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdtree'               " 文件树
Plug 'tpope/vim-surround'               " 环绕操作 [operator] (y/c/d)s
Plug 'terryma/vim-multiple-cursors'     " 多光标
Plug 'tpope/vim-commentary'             " 注释操作 [operator] gc
Plug 'vim-scripts/ReplaceWithRegister'  " 替换操作 [operator] gr
Plug 'vim-scripts/argtextobj.vim'       " 参数文本对象 [text-objects] (i/a)a
Plug 'tommcdo/vim-exchange'             " 互换操作 [operator] cx
Plug 'kana/vim-textobj-entire'          " 全文文本对象 [text-objects] (i/a)e
Plug 'machakann/vim-highlightedyank'    " 复制高亮
Plug 'dbakker/vim-paragraph-motion'     " 大括号增强 (只含有空格的行)
Plug 'michaeljsmith/vim-indent-object'  " 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下
Plug 'chrisbra/matchit'                 " 百分号增强 (自定义匹配内容, IdeaVim中默认可匹配 HTML标签/if-else 等)
" 用set的需要额外安装插件
set quickscope                          " 高亮每个单词中唯一的字符
" set which-key                           " 实时显示组合键
set peekaboo
set functiontextobj

source ~/vimfiles/vim/plugin/vim-easymotion.vim
" source ~/vimfiles/vim/plugin/vim-sneak.vim
source ~/vimfiles/vim/plugin/nerdtree.vim
source ~/vimfiles/vim/plugin/vim-surround.vim
source ~/vimfiles/vim/plugin/vim-multiple-cursors.vim
source ~/vimfiles/vim/plugin/vim-commentary.vim
source ~/vimfiles/vim/plugin/ReplaceWithRegister.vim
source ~/vimfiles/vim/plugin/argtextobj.vim.vim
source ~/vimfiles/vim/plugin/vim-exchange.vim
source ~/vimfiles/vim/plugin/vim-textobj-entire.vim
source ~/vimfiles/vim/plugin/vim-highlightedyank.vim
source ~/vimfiles/vim/plugin/vim-paragraph-motion.vim
source ~/vimfiles/vim/plugin/vim-indent-object.vim
source ~/vimfiles/vim/plugin/matchit.vim
source ~/vimfiles/vim/plugin/quick-scope.vim
" source ~/vimfiles/vim/plugin/whick-key.vim

