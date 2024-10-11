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
- `custom`自定义配置，需将`custom_example`**复制**并修改其中自定义内容

## Vim配置

- Windows

    - `vim`

      进入`C:/Users/用户名`目录

      ~~~bat
      git clone --depth 1 https://github.com/h1m3k0/vimrc.git vimfiles
      ~~~

    - `ideavim`

      将`C:/Users/用户名/.ideavimrc`内容修改为

        ~~~vimscript
        source ~/vimfiles/.ideavimrc
        ~~~

- Linux

    - 个人

      ~~~shell
      cd ~
      git clone --depth 1 https://github.com/h1m3k0/vimrc.git .vim
      ~~~

    - 服务器

      多人共用时，为了不影响其他人使用，可以将配置保存在自定义目录，并设置自定义运行命令。
      例如配置文件保存在`/xxxx/.vimx`，使用`vimx`命令运行
      中添加脚本快捷启动

        1. 拉取配置

           ~~~shell
           git clone --depth 1 https://github.com/h1m3k0/vimrc.git .vimx
           ~~~

        2. 创建`vimx`命令为`vim -u ~/.vimx/main`

           在`/usr/bin/`创建文件`vimx`, 内容为

              ~~~vimx
              #!/bin/bash
              exec vim -u /xxxx/.vimx/vimrc "$@"
              ~~~

           修改`vimx`权限

              ~~~shell
              chomd +x vimx
              ~~~