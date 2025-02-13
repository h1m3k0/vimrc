" IdeaVim额外的配置
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

" Action mapping
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


" Action command
"
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

" ========== Function ==========
" 执行IdeaVimAction 多个命令根据<space>切分
function! IdeaVimAction(actions)
    let l:actions = split(a:actions, ' ') 
    for action in l:actions
        execute 'action '.l:action
    endfor
endfunction
