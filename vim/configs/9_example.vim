" 最后加载
" 设置主题
try
    if has('termguicolors')
        set bg=dark
        colorscheme everforest
    else
        colorscheme onedark
    endif
catch
endtry
" 设置字体
if has('gui_running')
    try
        set guifont=JetBrainsMonoNL_NFM:h12
    catch
        try
            set guifont=Consolas:h12
        catch
        endtry
    endtry
endif

" 加载自定义配置
let s:match = matchlist(resolve(expand('<sfile>:p')), '\(\d\)_example\.vim$')
if !empty(s:match) && filereadable(expand('<sfile>:h') . '/' . s:match[1] . '.vim')
  execute 'source <sfile>:h/' . s:match[1] . '.vim'
endif
