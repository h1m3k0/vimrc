" IdeaVim额外的配置
" 设置ideavim的leader
let g:mapleader = g:config_ideavim_mapleader
" ========== ideavim额外的set配置 开始 ==========
"
" set ideacopypreprocess
" set ideaglobalmode
set ideajoin
" set ideamarks
" set idearefactormode=
" set ideastatusicon=
" set ideawrite=
" set lookupkeys=
set trackactionids
" set visualdelay=
" ---------- ideavim额外的set配置 结束 ----------

" ========== 自定义映射Action 开始 ========== 
"
" 映射Action启用<Space>作为前缀
map  <Leader>  <Nop>
" 重命名
map  <Leader>r  <Action>(RenameElement)
" 引入变量 
map  <Leader>v  <Action>(IntroduceVariable)
" 全局查找 
map  <Leader>f  <Action>(FindInPath)
" 补全 c-s-enter
map  <Leader>;  <Action>(EditorCompleteStatement)
" 优化导入 c-a-o
map  <Leader>o  <Action>(OptimizeImports)
" 格式化 c-a-l
map  <Leader>l  <Action>(ReformatCode)
" 环绕 c-a-t
map  <Leader>t  <Action>(SurroundWith)
" 提示 a-enter
map  <Leader>i  <Action>(ShowIntentionActions)
" 全局搜索 shift-shift
map  <Leader>s  <Action>(SearchEverywhere)
" 方法跳转到子类实现
map  <Leader>j  <Action>(GotoImplementation)
" 方法跳转到父类定义
map  <Leader>k  <Action>(GotoSuperMethod)
" ---------- 自定义映射Action 结束 ----------


" ========== 自定义命令Action 开始 ==========
"
" VimReload 重新加载ideavimrc
command!  VimReload  call  IdeaVimAction('IdeaVim.ReloadVimRc.reload')
" Run
command!  Run  call  IdeaVimAction('Run')
" RunClass
command!  RunClass  call  IdeaVimAction('RunClass')
" Debug
command!  Debug  call  IdeaVimAction('Debug')
" Stop
command!  Stop  call  IdeaVimAction('Stop')
" ActivateTerminalToolWindow 打开终端
command!  Terminal  call  IdeaVimAction('ActivateTerminalToolWindow')
" MavenReload 重新加载maven
command!  MavenReload  call  IdeaVimAction('Maven.Reimport Maven.UpdateFolders')
command!  Git  call  IdeaVimAction('Git.Menu')
" Vim 关闭ideavim
command!  Vim  call  IdeaVimAction('VimPluginToggle')
" ---------- 自定义命令Action 结束 ----------

" ========== Function ========== 
" 执行IdeaVimAction 多个命令根据<space>切分
function! IdeaVimAction(actions)
    let l:actions = split(a:actions, ' ') 
    for action in l:actions
        execute 'action '.l:action
    endfor
endfunction
" ---------- Function ----------
" 恢复vim的leader
let g:mapleader = g:config_vim_mapleader
