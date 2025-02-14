" IdeaVim Plugins {{{
" quickscope 高亮f {{{
set quickscope
let g:qs_highlight_on_keys = ['f', 'F']
" }}}
" easymotion 快速跳转 [motions] {{{
set easymotion
" 智能大小写
let g:EasyMotion_smartcase = 1
" 禁用默认映射
let g:EasyMotion_do_mapping = 0
map  <Leader>f  <Plug>(easymotion-bd-f)
map  <Leader>F  <Plug>(easymotion-bd-f)
map  <Leader>t  <Plug>(easymotion-bd-t)
map  <Leader>T  <Plug>(easymotion-bd-t)
"  }}}
" NERDTree 文件树 {{{
set NERDTree
nnoremap  <Leader>e  <Esc>:NERDTreeFind<CR>
" }}}
" surround 环绕操作 [operator] (y/c/d)s {{{
set surround
" }}}
" multiple-cursors 多光标 {{{
set multiple-curcors
" }}}
" commentary 注释操作 [operator] gc {{{
set commentary
" }}}
" ReplaceWithRegister 替换操作 [operator] gr {{{
set ReplaceWithRegister
" }}}
" argtextobj 参数文本对象 [text-objects] (i/a)a {{{
set argtextobj
let g:argtextobj_pairs='(:),{:},[:],<:>'
" }}}
" exchange 互换操作 [operator] cx {{{
set exchange
" }}}
" textobj-entire 全文文本对象 [text-objects] (i/a)e {{{
set textobj-entire
" }}}
" highlightedyank 复制高亮 {{{
set highlightedyank
let g:highlightedyank_highlight_duration = '2000'
" }}}
" vim-indent-obj 缩进文本对象 [text-objects] ii当前 ai包含上一行 aI包含上下 {{{
set textobj-indent
" }}}
" matchit 百分号增强 {{{
set matchit
map M %
" }}}
" peekaboo 显示寄存器 {{{
set peekaboo
" }}}
" functiontextobj 方法文本对象 if af {{{
set functiontextobj
" }}}
" quickscope 后续 {{{
onoremap f f
onoremap F F
" }}}
" }}}

" IdeaVim settings {{{
set noideacopypreprocess
set noideaglobalmode=off
set ideajoin
set noideamarks
set idearefactormode=select
set ideastatusicon=enabled
set ideavimsupport=dialog
set ideawrite=all
" set lookupkeys=
set trackactionids
set visualdelay=100
" }}}

" IdeaVim Action {{{
" Mappings {{{
" 重命名 Shift-F6
map  <Leader>r <Action>(RenameElement)
" 全局搜索 Ctrl-Shift-F
map  <Leader>s <Action>(FindInPath)
" 格式化 Alt-Ctrl-L
map  <Leader>l <Action>(ReformatCode)
" 选择 Ctrl-w
map  <C-S>     <Action>(EditorSelectWord)
" 跳转到定义 Ctrl-B
map  <Leader>k <Action>(GotoDeclaration)
" 跳转到实现 Alt-Ctrl-B
map  <Leader>j <Action>(GotoImplementation)

" 引入变量 Alt-Ctrl-V
map  <Leader>v <Action>(IntroduceVariable)
" 补全 Ctrl-Shift-Enter
map  <Leader>; <Action>(EditorCompleteStatement)
" 优化导入 Ctrl-Shift-O
map  <Leader>o <Action>(OptimizeImports)
" 环绕 Alt-Ctrl-T
map  <Leader>t <Action>(SurroundWith)
" 提示 Alt-Enter
map  <Leader>i <Action>(ShowIntentionActions)
" }}}

" Commands {{{
" VimReload 重新加载ideavimrc
command! VimReload   call IdeaVimAction('IdeaVim.ReloadVimRc.reload')
" Run
command! Run         call IdeaVimAction('Run')
" RunClass
command! RunClass    call IdeaVimAction('RunClass')
" Debug
command! Debug       call IdeaVimAction('Debug')
" Stop
command! Stop        call IdeaVimAction('Stop')
" ActivateTerminalToolWindow 打开终端
command! Terminal    call IdeaVimAction('ActivateTerminalToolWindow')
" MavenReload 重新加载maven
command! MavenReload call IdeaVimAction('Maven.Reimport Maven.UpdateFolders')
command! Git         call IdeaVimAction('Git.Menu')
" Vim 关闭ideavim
command! Vim         call IdeaVimAction('VimPluginToggle')
" }}}
" Function {{{
" 执行IdeaVimAction 多个命令根据<space>切分
function! IdeaVimAction(actions)
    let l:actions = split(a:actions, ' ') 
    for action in l:actions
        execute 'action '.l:action
    endfor
endfunction
" }}}
" }}}
