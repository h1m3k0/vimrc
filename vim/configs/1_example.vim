" 优先加载

" Leader键
let g:mapleader = ' '
let g:maplocalleader = ' '

" 0: 其他键盘
" 1: 60键键盘
let g:config_keyboard = 1

" HTTPS  https://github.com/%s.git
" SSH    git@github.com:%s.git
let g:plug_url_format = 'git@github.com:%s.git'

" default
" LeaderF 
" fzf
let g:fuzzy = 'default'

" 1
" 0
let g:nerdfont = 1

" 加载自定义配置
let s:match = matchlist(resolve(expand('<sfile>:p')), '\(\d\)_example\.vim$')
if !empty(s:match)
  execute 'source <sfile>:h/' . s:match[1] . '.vim'
endif
