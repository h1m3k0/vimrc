" neovide的配置


" 输入法
augroup ime_input
    autocmd!
    " 插入模式允许使用输入法
    autocmd InsertLeave * execute "let g:neovide_input_ime=v:false"
    autocmd InsertEnter * execute "let g:neovide_input_ime=v:true"
    " 命令行模式搜索时允许使用输入法
    autocmd CmdlineLeave /,? execute "let g:neovide_input_ime=v:false"
    autocmd CmdlineEnter /,? execute "let g:neovide_input_ime=v:true"
augroup END
