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
     source ~/vimfiles/.ideavimrc
     " 部分idea插件异步加载存在问题, 导致有的配置没有加载
     " 通过再次source配置文件解决, 视情况可多次加载
     source ~/vimfiles/.ideavimrc
     ~~~
   
3. 初始化

   复制 `~/vimfiles/vim/configs/config_example.vim` 到 `~/vimfiles/vim/configs/config.vim`，修改默认配置

   - vim

     启动后执行 `:PlugInstall` 安装插件

   - ideavim

     手动安装插件，详见
     
     > https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins

4. Linux额外

   - 无网环境

     `windows`运行`scripts/delete_.git.bat`，删掉`.git`和`plugged/**/.git`，精简大小。

     `linux`运行`scripts/replace_cr.sh`，将`windows换行`换成`linux换行`（去掉`^M`），即可运行。
   
   - 无插件All-In-One
     
     复制 `vim/configs/config_expample.vim` 、 `vim/setting.vim` 、 `vim/mapping.vim` 、`vim/vim.vim` 里内容



​     

