" 优先加载

" Leader键
let g:mapleader = ' '
let g:maplocalleader = ' '

" HTTPS  https://github.com/%s.git
" SSH    git@github.com:%s.git
let g:plug_url_format = 'git@github.com:%s.git'

" [0(其他键盘)] [1(60键键盘)]
let g:config_keyboard = 1

" [1] [0]
let g:config_nerdfont = 1

" 选择插件
let g:config_plugins = exists('g:config_plugins') ? g:config_plugins : {}
" [default] [LeaderF] [fzf] [ctrlp|grepper] [fuzzyy]
let g:config_plugins.fuzzy = 'default'
" [1] [0]
let g:config_plugins.coc = 1

" 加载自定义配置
let s:match = matchlist(resolve(expand('<sfile>:p')), '\(\d\)_example\.vim$')
if !empty(s:match) && filereadable(expand('<sfile>:h') . '/' . s:match[1] . '.vim')
  execute 'source <sfile>:h/' . s:match[1] . '.vim'
endif
