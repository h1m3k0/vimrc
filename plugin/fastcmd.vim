let g:fastcmd_mode = {
            \     'batch': v:false,
            \     'config': {},
            \ }
" 清空环境
function! fastcmd#clean() 
    " 保存当前设置(如果有其他影响的配置项, 需要补充)
    let g:fastcmd_mode.config.runtimepath = &runtimepath
    let g:fastcmd_mode.config.eventignore = &eventignore
    let g:fastcmd_mode.config.filetype    = &filetype
    let g:fastcmd_mode.config.indentexpr  = &indentexpr
    let g:fastcmd_mode.config.foldmethod  = &foldmethod
    let g:fastcmd_mode.config.clipboard   = &clipboard
    " 清空设置
    set runtimepath=
    set eventignore=all
    set filetype=
    set indentexpr=
    set foldmethod=manual
    set clipboard=
endfunction

" 恢复环境
function! fastcmd#load()
    " 恢复设置
    let &runtimepath = g:fastcmd_mode.config.runtimepath
    let &eventignore = g:fastcmd_mode.config.eventignore
    let &filetype    = g:fastcmd_mode.config.filetype
    let &indentexpr  = g:fastcmd_mode.config.indentexpr
    let &foldmethod  = g:fastcmd_mode.config.foldmethod
    let &clipboard   = g:fastcmd_mode.config.clipboard
    " 强制重载文件类型
    if g:fastcmd_mode.config.filetype != ''
        silent! doautocmd FileType
    endif
endfunction

function! g:fastcmd#normal(line1, line2, command) range
    if !g:fastcmd_mode.batch
        " 清空环境
        call fastcmd#clean()
    endif
    " 执行命令
    try
        if a:command != ''
            execute 'noautocmd ' . a:line1 . ',' . a:line2 .
                        \ 'normal! ' . a:command
        endif
    endtry
    if !g:fastcmd_mode.batch
        " 恢复环境
        call fastcmd#load()
    endif
endfunction

" 查找字符串中第一个非转义的斜杠位置
function! fastcmd#find_param1(str) abort
    let l:len = len(a:str)
    let l:i = 0
    while l:i < l:len
        if a:str[l:i] ==# '\'
            " 跳过转义字符（反斜杠及其下一个字符）
            let l:i += 2
        elseif a:str[l:i] ==# '/'
            " 找到非转义斜杠
            return l:i
        else
            let l:i += 1
        endif
    endwhile
    return -1  " 未找到
endfunction

function! fastcmd#global_normal(global, params) range
    " 必须以斜杠开头
    if a:params[0] !=# '/'
        echo "Error: Command must start with /"
        return
    endif
    " 去掉开头斜杠
    let str = a:params[1:]
    " 查找第一个非转义斜杠
    let idx = fastcmd#find_param1(str)

    if idx == -1
        echo "Error: Missing second slash"
        return
    endif

    let pattern = str[:idx-1]
    let command = str[idx+1:]

    let g:fastcmd_mode.batch = v:true
    call fastcmd#clean()
    execute a:global . '/' . pattern . '/' . ':Normal ' . command
    call fastcmd#load()
    let g:fastcmd_mode.batch = v:false
endfunction

" `:Normal {command}`  ==  `:normal! {command}`
command! -range -nargs=1 NORMAL call g:fastcmd#normal(<line1>, <line2>, <q-args>)
command! -range -nargs=1 Normal call g:fastcmd#normal(<line1>, <line2>, <q-args>)
" `:GNormal/{pattern}/{command}`  ==  `:g/{pattern}/:normal! {command}`
command! -range -nargs=1 GNormal call g:fastcmd#global_normal('g', <q-args>)
command! -range -nargs=1 GNORMAL call g:fastcmd#global_normal('g', <q-args>)
" `:VNormal/{pattern}/{command}`  ==  `:v/{pattern}/:normal! {command}`
command! -range -nargs=1 VNormal call g:fastcmd#global_normal('v', <q-args>)
command! -range -nargs=1 VNORMAL call g:fastcmd#global_normal('v', <q-args>)
