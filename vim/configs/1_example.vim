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
" ctrlp || grepper
" fuzzyy
let g:config_fuzzy = 'default'

" default
" con
" mu
let g:config_cmp = 'default'
" 1
" 0
let g:config_nerdfont = 1

" 加载自定义配置
let s:match = matchlist(resolve(expand('<sfile>:p')), '\(\d\)_example\.vim$')
if !empty(s:match) && filereadable(expand('<sfile>:h') . '/' . s:match[1] . '.vim')
  execute 'source <sfile>:h/' . s:match[1] . '.vim'
endif
