## 结构说明

- `vimrc`默认的入口文件
- `vimrcs/`vim配置
  - `basic.vim` 基础配置
  - `plugin.vim` 启用插件配置
  - `mapping.vim` 映射配置
  - `ideavim.vim` IdeaVim的特殊配置
  - `startify.vim` 首页配置
- `custom_example`自定义配置样例
  - `config.vim` 自定义配置
  - `main` Linux自定义入口样例
- `custom`自定义配置, 需将`custom_example`**复制**并修改其中自定义内容

## Vim配置

- Windows

  - `vim`/`gvim`

    进入`C:/Users/username`目录

    执行命令:

    ~~~bat
    git clone --depth 1 https://github.com/h1m3k0/vimrc.git vimfiles
    ~~~

    复制`custom_example`到`custom`

  - `ideavim`

    - 将`C:/Users/username/vimfiles/.ideavimrc`复制到`C:/Users/username/.ideavimrc`
    - 或者将当前的`.ideavimrc`内容修改为
      ~~~vimscript
      source ~/vimfiles/.ideavimrc
      ~~~

- Linux

  - 个人系统

    ~~~shell
    cd ~
    git clone --depth 1 https://github.com/h1m3k0/vimrc.git .vim
    ~~~

  - 服务器root

    建议将配置保存在其他目录(例如`~/.vimx`), 通过`vim -u ~/.vimx/vimrc`命令启动. 修改`~/.bashrc`设置别名或在`/usr/bin`中添加脚本快捷启动

    1. 拉取配置

       ~~~shell
       cd ~
       git clone --depth 1 https://github.com/h1m3k0/vimrc.git .vimx
       ~~~

    2. 复制`custom_example`到`custom`, 并修改`main`

       ~~~vimscript
       set rtp+=~/.vimx/
       ru vimrc
       ~~~
       
    3. 修改`vim-plug`存储路径(可以不改, 不改的话默认存储到`~/.vim/plugged`)

       在`custom/config.vim`中修改

       ~~~vimscript
       let g:vim_config_plug_path="~/.vim/plugged"
       ~~~
    
    4. 创建`vimx`命令为`vim -u ~/.vimx/main`

       - 第1种方法, 创建别名

         修改`~/.bashrc`, 添加一行

         ~~~bash
         alias vimx='vim -u ~/.vimx/main'
         ~~~
    
         重新加载配置文件

         ~~~shell
         source ~/.bashrc
         ~~~
    
       - 第2种方法, 创建命令

         在`/usr/bin`创建文件`vimx`, 内容为

         ~~~vimx
         #!/bin/bash
         exec vim -u ~/.vimx/main "$@"
         ~~~
    
         修改`vimx`权限

         ~~~shell
         chomd +x vimx
         ~~~
    
  - 服务器非root

    执行`sodu vimx`时无法加载到命令, 应把`服务器root`步骤下的`~路径`改为`绝对路径`
