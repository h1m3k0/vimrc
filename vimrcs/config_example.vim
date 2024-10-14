" 自定义参数
" Leader键
let g:config_vim_mapleader = "'"
let g:config_ideavim_mapleader = " "

let g:mapleader = g:config_vim_mapleader

" 0: 当前是开发环境(本地)
" 1: 当前是生产环境(服务器 默认has("clipboard")为0)
let g:config_environment = 1

" 0: 其他键盘
" 1: 60键键盘
let g:config_keyboard = 1

" vim-plug存储位置(''会存到默认位置)
let g:config_plugged_path = ''
