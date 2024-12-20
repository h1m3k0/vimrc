" IdeaVim额外的配置
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
map  <Space>   <Nop>
" 重命名 Shift-F6
map  <Space>r  <Action>(RenameElement)
" 全局搜索 Ctrl-Shift-F
map  <Space>s  <Action>(FindInPath)
" 格式化 Alt-Ctrl-L
map  <Space>l  <Action>(ReformatCode)
" 选择 Ctrl-w
map  <C-s>     <Action>(EditorSelectWord)
" 跳转到定义 Ctrl-B
map  <Space>k  <Action>(GotoDeclaration)
" 跳转到实现 Alt-Ctrl-B
map  <Space>j  <Action>(GotoImplementation)
" ---------- 自定义映射Action 结束 ----------

" ========== coc未实现的Action 开始 ==========
" 引入变量 Alt-Ctrl-V
map  <Space>v  <Action>(IntroduceVariable)
" 补全 Ctrl-Shift-Enter
map  <Space>;  <Action>(EditorCompleteStatement)
" 优化导入 Ctrl-Shift-O
map  <Space>o  <Action>(OptimizeImports)
" 环绕 Alt-Ctrl-T
map  <Space>t  <Action>(SurroundWith)
" 提示 Alt-Enter
map  <Space>i  <Action>(ShowIntentionActions)
" ---------- coc未实现的Action 结束 ----------
"
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
