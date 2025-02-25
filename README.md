### 使用

1. `git clone` 到（ windows `~/vimfiles` 或 linux `~/.vim` ）

   ~~~shell
   git clone --depth 1 git@github.com:h1m3k0/vimrc.git ~/vimfiles
   ~~~

2. 引入启动文件

   - ideavim

     文件 `~/.ideavimrc`
     
     添加 `~/vimfiles/.ideavimrc` 的自定义配置

     ~~~vimscript
     " 添加配置, 如
     " 启用映射方向键
     let g:map_arrow_key = 1
     " 启用映射esc键映射
     let g:map_esc_key = 1
     source ~/vimfiles/.ideavimrc
     ~~~
   
3. 初始化

   复制 `~/vimfiles/vim/configs/config_example.vim` 到 `~/vimfiles/vim/configs/config.vim`，修改默认配置

   - vim

     启动后执行 `:PlugInstall` 安装插件

   - ideavim

     手动安装插件，详见
     
     > https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins
