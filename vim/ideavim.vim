" IdeaVim Plugins {{{1
set quickscope " 高亮f(配置的前半部分) {{{2
  let g:qs_highlight_on_keys = ['f', 'F']

set easymotion " 快速跳转 [motions] {{{2
  " 智能大小写
  let g:EasyMotion_smartcase = 1
  " 禁用默认映射
  let g:EasyMotion_do_mapping = 0
  map  <Leader>f  <Plug>(easymotion-bd-f)
  map  <Leader>F  <Plug>(easymotion-bd-f)
  map  <Leader>t  <Plug>(easymotion-bd-t)
  map  <Leader>T  <Plug>(easymotion-bd-t)
set NERDTree " 文件树 {{{2
  nnoremap  <Leader>e  <Esc>:NERDTreeFind<CR>
set surround " 环绕 (y/c/d)s {{{2

set multiple-curcors " 多光标 {{{2

set commentary " 注释 gc {{{2

set ReplaceWithRegister " 替换 gr {{{2

set argtextobj " 参数文本对象 (i/a)a {{{2
  let g:argtextobj_pairs='(:),{:},[:],<:>'
set exchange " 互换 cx {{{2

set textobj-entire " 全文文本对象 (i/a)e {{{2

set highlightedyank " 复制高亮 {{{2
  let g:highlightedyank_highlight_duration = '2000'
set textobj-indent " 缩进文本对象 (i/a)(i/I) {{{2

set matchit " 增强匹配 {{{2
  map M %
set peekaboo " 显示寄存器内容 {{{2

set functiontextobj " 方法文本对象 (i/a)f {{{2

" quickscope(配置的后续) {{{2
onoremap f f
onoremap F F

" IdeaVim settings {{{2
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

" IdeaVim Action {{{0
" Mappings {{{1
" <Leader>r => RenameElement => 重命名 Shift-F6 {{{2
map  <Leader>r <Action>(RenameElement)
" <Leader>s => FindInPath => 全局搜索 Ctrl-Shift-F {{{2 
map  <Leader>s <Action>(FindInPath)
" <Leader>l => ReformatCode => 格式化 Alt-Ctrl-L {{{2
map  <Leader>l <Action>(ReformatCode)
" <C-S> => EditorSelectWord => 选择 Ctrl-w {{{2
map  <C-S>     <Action>(EditorSelectWord)
" gd => GotoDeclaration => 跳转到定义 Ctrl-B {{{2
map  gd <Action>(GotoDeclaration)
" gI => GotoImplementation => 跳转到实现 Alt-Ctrl-B {{{2
map  gI <Action>(GotoImplementation)
" gy => GotoTypeDeclaration => 跳转到类型 Ctrl-Shift-B
map  gy <Action>(GotoTypeDeclaration)

" <Leader>v => IntroduceVariable => 引入变量 Alt-Ctrl-V {{{2
map  <Leader>v <Action>(IntroduceVariable)
" <Leader>; => EditorCompleteStatement => 补全 Ctrl-Shift-Enter {{{2
map  <Leader>; <Action>(EditorCompleteStatement)
" <Leader>o => OptimizeImports => 优化导入 Ctrl-Shift-O {{{2
map  <Leader>o <Action>(OptimizeImports)
" <Leader>t => SurroundWith => 环绕 Alt-Ctrl-T {{{2
map  <Leader>t <Action>(SurroundWith)
" <Leader>i => ShowIntentionActions => 提示 Alt-Enter {{{2
map  <Leader>i <Action>(ShowIntentionActions)

" Commands {{{1
" VimReload => 重新加载ideavimrc {{{2
command! VimReload   call IdeaVimAction('IdeaVim.ReloadVimRc.reload')
" Run {{{2
command! Run         call IdeaVimAction('Run')
" RunClass {{{2
command! RunClass    call IdeaVimAction('RunClass')
" Debug {{{2
command! Debug       call IdeaVimAction('Debug')
" Stop {{{2
command! Stop        call IdeaVimAction('Stop')
" ActivateTerminalToolWindow => 打开终端 {{{2
command! Terminal    call IdeaVimAction('ActivateTerminalToolWindow')
" MavenReload => 重新加载maven {{{2
command! MavenReload call IdeaVimAction('Maven.Reimport Maven.UpdateFolders')
" Git {{{2
command! Git         call IdeaVimAction('Git.Menu')
" Vim => 关闭ideavim {{{2
command! Vim         call IdeaVimAction('VimPluginToggle')

" Function {{{1
function! IdeaVimAction(actions) " {{{2
    let l:actions = split(a:actions, ' ') 
    for action in l:actions
        execute 'action '.l:action
    endfor
endfunction

" 清除选择模式的映射
smapclear
