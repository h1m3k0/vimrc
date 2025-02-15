" 自定义参数
" Leader键
let g:mapleader = ' '
let g:maplocalleader = ' '

" 0: 其他键盘
" 1: 60键键盘
let g:config_keyboard = 1

" HTTPS  https://github.com/%s.git
" SSH    git@github.com:%s.git
let g:plug_url_format = 'git@github.com:%s.git'

" 0: 开发模式(vim9)
" 1: 轻量模式
let g:light = v:version < 900
