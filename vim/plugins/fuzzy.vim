let s:fuzzy = g:config_plugins.fuzzy
if s:fuzzy == 'default'
    if (has('python') || has('python2') || has('python3')) && executable('python')
        let s:fuzzy = 'LeaderF'
    elseif !has('win32') && v:version >= 800
        let s:fuzzy = 'fzf'
    elseif v:version >= 900
        let s:fuzzy = 'fuzzyy'
    else
        let s:fuzzy = 'ctrlp-grepper'
    endif
endif
if has('nvim')
    let s:fuzzy = 'nvim'
endif

if Plug('Yggdroot/LeaderF', s:fuzzy == 'LeaderF', { 'do': ':LeaderfInstallCExtension' })
    " 快; 需要python
    let g:Lf_CommandMap = {
                \     '<C-J>': ['<Down>', '<C-J>'],
                \     '<C-K>': ['<Up>', '<C-K>'],
                \ }
    let g:Lf_RgConfig = [
                \ "--max-columns=300",
                \ "--type-add web:*.{html,css,js}*",
                \ "--glob=!git/*",
                \ "--hidden"
                \ ]
    let g:Lf_ShortcutF = '<Nop>'
    let g:Lf_UseCache = 0
    let g:UseVersionControlTool = 0

    nnoremap <Leader>f<Space> <Esc>:<C-U>Leaderf<Space>

    nnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file')<CR><CR>
    xnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file --input %s', leaderf#Rg#visual())<CR><CR>

    nnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg')<CR><CR>
    xnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg %s', leaderf#Rg#visual())<CR><CR>
endif

if Plug('junegunn/fzf', s:fuzzy == 'fzf', { 'do': { -> fzf#install() } }) | endif
if Plug('junegunn/fzf.vim', s:fuzzy == 'fzf')
    " 快; 对windows支持不好
    let preview_obj = {
                \ 'options': [
                \     '--layout=reverse',
                \     '--info=inline',
                \     '--preview',
                \     (has('win32') ? 'type' : 'cat') . ' {}'
                \   ]
                \ }
    " Files 预览
    command! -bang -nargs=? -complete=dir Files
                \ call fzf#vim#files(
                \   <q-args>,
                \   preview_obj,
                \   <bang>0)
    nnoremap <silent> <Leader>ff <CMD>Files<CR>

    nnoremap <silent> <Leader>fg <CMD>RG<CR>
endif

if Plug('ctrlpvim/ctrlp.vim', s:fuzzy == 'ctrlp-grepper')
    " 慢;
    let g:ctrlp_map = '<Nop>'
    nnoremap <silent> <Leader>ff :<C-U><C-R>=printf('CtrlP %s', getcwd())<CR><CR>
endif
if Plug('mhinz/vim-grepper', s:fuzzy == 'ctrlp-grepper')
    " 慢; grepper仅依赖git(findstr有bug)
    let g:grepper = {}
    let g:grepper.highlight = 1
    nnoremap <silent> <Leader>fg :<C-U>Grepper<CR>
endif

if Plug('Donaldttt/fuzzyy', s:fuzzy == 'fuzzyy')
    " 慢; 需要vim9, 无依赖
    let g:fuzzyy_enable_mappings = 0
    nnoremap <silent> <Leader>ff <CMD>FuzzyFiles<CR>
    nnoremap <silent> <Leader>fg <CMD>FuzzyGrep<CR>
endif
