### 使用

1. `git clone` 到任意位置（如 `D:/.vim`）

   ~~~shell
   git clone git@github.com:h1m3k0/.vim.git D:/.vim
   ~~~

2. 引入启动文件

   - vim

     文件 `~/vimfiles/vimrc`

     ~~~vimscript
     execute D:/.vim/vimrc
     ~~~

   - ideavim

     文件 `~/.ideavimrc`

     ~~~vimscript
     let g:VIMRC_DIR = 'D:/.vim'
     execute 'source '.g:VIMRC_DIR.'/.ideavimrc'
     ~~~
   
3. 初始化

   复制 `D:/.vim/vim/configs/config_example.vim` 到 `D:/.vim/vim/configs/config.vim`，修改默认配置

   - vim

     启动后执行 `:PlugInstall` 安装插件

   - neovim

     `lazy.nvim` 自动安装插件，部分插件有额外环境需求（c）

   - ideavim

     手动安装 `ideavim.plugin.vim` 中通过`set`引入的插件