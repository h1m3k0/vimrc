" 最后加载
try
    if has('termguicolors')
        set bg=dark
        colorscheme everforest
    else
        colorscheme onedark
    endif
catch
endtry

" 加载自定义配置
let s:match = matchlist(resolve(expand('<sfile>:p')), '\(\d\)_example\.vim$')
if !empty(s:match)
  execute 'source <sfile>:h/' . s:match[1] . '.vim'
endif
