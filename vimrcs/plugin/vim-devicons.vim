" vim-devicons
" 文件类型图标, 可以在多个插件中根据文件类型展示对应图标
" 1. 需要安装实现了NerdFont的字体(能展示对应字符)
"   在 https://github.com/ryanoasis/nerd-fonts
"   或 https://nerdfonts.com
"   中找满足NerdFont的字体
" 2. 设置gui字体 set guifont=XX
"   安装字体时能看到字体名, 或在系统中查找字体名称
"   或 在vim中输入 [:set guifont=] 再通过<Tab>查找对应名称
"   空格用 [\ ] 表示, 也可以用 [_] 表示
" 3. 尽量不用 [:set guifont=A,\ B,\ C] 的方式
"   虽然vim支持更优雅的方式, 但:Bigger/:Smaller需要单独设置的guifont

try
  set guifont=JetBrainsMonoNL_NFM:h11
catch
endtry

try
  set guifont=CaskaydiaMono_NFM:h11
catch
endtry
