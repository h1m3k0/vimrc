### 使用

1. `git clone` 到任意位置（如 windows `~/vimfiles` 或 linux `~/.vim` ）

   ~~~shell
   git clone --depth 1 git@github.com:h1m3k0/vimrc.git ~/vimfiles
   ~~~

2. 引入启动文件

   - ideavim

     文件 `~/.ideavimrc`

     ~~~vimscript
     let g:vimrc_home = '~/vimfiles'
     execute 'source '.g:vimrc_home.'/.ideavimrc'
     ~~~
   
3. 初始化

   复制 `~/vimfiles/vim/configs/config_example.vim` 到 `~/vimfiles/vim/configs/config.vim`，修改默认配置

   - vim

     启动后执行 `:PlugInstall` 安装插件

   - ideavim

     手动安装 `ideavim.plugin.vim` 的（部分）插件，详见
     
     > https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins
