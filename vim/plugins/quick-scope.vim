" quick-scope


let g:qs_highlight_on_keys = ['f', 'F']

if has('ide')
  set quickscope
endif

" 禁止操作符等待时高亮
onoremap  f  f
onoremap  F  F
