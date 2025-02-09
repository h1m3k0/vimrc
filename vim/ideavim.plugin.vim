" easymotion 快速跳转 [motions]
call IdeaVimSourcePlugin('easymotion/vim-easymotion')
" NERDTree 文件树
call IdeaVimSourcePlugin('preservim/nerdtree')
" surround 环绕操作 [operator] (y/c/d)s
call IdeaVimSourcePlugin('tpope/vim-surround')
" multiple-cursors 多光标
call IdeaVimSourcePlugin('terryma/vim-multiple-cursors')
" commentary 注释操作 [operator] gc
call IdeaVimSourcePlugin('tpope/vim-commentary')
" ReplaceWithRegister 替换操作 [operator] gr
call IdeaVimSourcePlugin('vim-scripts/ReplaceWithRegister')
" argtextobj 参数文本对象 [text-objects] (i/a)a
call IdeaVimSourcePlugin('vim-scripts/argtextobj.vim')
" exchange 互换操作 [operator] cx
call IdeaVimSourcePlugin('tommcdo/vim-exchange')
" textobj-entire 全文文本对象 [text-objects] (i/a)e
call IdeaVimSourcePlugin('kana/vim-textobj-entire')
" highlightedyank 复制高亮
call IdeaVimSourcePlugin('machakann/vim-highlightedyank')
" vim-pagragraph-motion 大括号增强 (只含有空格的行)
call IdeaVimSourcePlugin('dbakker/vim-paragraph-motion')
" vim-indent-obj 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下
call IdeaVimSourcePlugin('michaeljsmith/vim-indent-object')
" matchit 百分号增强 (自定义匹配内容, IdeaVim中默认可匹配 HTML标签/if-else 等)
call IdeaVimSourcePlugin('chrisbra/matchit')

" 后面的需要单独安装idea插件

" quickscope 高亮f/t的跳转
call IdeaVimSourcePlugin('unblevable/quick-scope')
" peekaboo 显示寄存器
set peekaboo
" functiontextobj 方法文本对象 if af
set functiontextobj

" 设置插件
" Plug 并且 source
" 或 只有set (需要手动再调用IdeaVimSource引入配置)
function! IdeaVimSourcePlugin(plug)
  let l:splits = split(a:plug, '/')
  if len(l:splits) == 2
    " 执行Plugin
    execute 'Plug "'.a:plug.'"'
    call IdeaVimSource('/vim/plugins/'.l:splits[1].'.vim')
  else
    execute 'set '.a:plug
  endif
endfunction

" 在g:MYVIMDIR下 引入配置文件
function! IdeaVimSource(path)
  let l:path = join(split(a:path, '\'), '/')
  let l:path = join(split(l:path, '/'), '/')
  let l:path = '/'.l:path
  execute 'source '.g:MYVIMDIR.l:path
endfunction
