let s:fuzzy = g:config_plugins.fuzzy
if s:fuzzy == 'default'
    if (has('python') || has('python2') || has('python3')) && executable('python')
        let s:fuzzy = 'LeaderF'
    elseif !has('win32') && v:version >= 800
        let s:fuzzy = 'fzf'
    elseif v:version >= 900
        let s:fuzzy = 'fuzzyy'
    else
        let s:fuzzy = 'ctrlp'
    endif
endif

if s:fuzzy == 'LeaderF'

    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

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

    nnoremap <Leader>f <Esc>:<C-U>Leaderf

    nnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file')<CR><CR>
    xnoremap <silent> <Leader>ff :<C-U><C-R>=printf('Leaderf file --input %s', leaderf#Rg#visual())<CR><CR>

    nnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg')<CR><CR>
    xnoremap <silent> <Leader>fg :<C-U><C-R>=printf('Leaderf rg %s', leaderf#Rg#visual())<CR><CR>

endif

if s:fuzzy == 'fzf'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

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

if s:fuzzy == 'ctrlp' || s:fuzzy == 'grepper'

    Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<Nop>'
    nnoremap <silent> <Leader>ff :<C-U><C-R>=printf('CtrlP %s', getcwd())<CR><CR>

    Plug 'mhinz/vim-grepper'
    let g:grepper = {}
    let g:grepper.highlight = 1
    nnoremap <silent> <Leader>fg :<C-U>Grepper<CR>

endif

if s:fuzzy == 'fuzzyy'

    Plug 'Donaldttt/fuzzyy'
    let g:fuzzyy_enable_mappings = 0
    nnoremap <silent> <Leader>ff <CMD>FuzzyFiles<CR>
    nnoremap <silent> <Leader>fg <CMD>FuzzyGrep<CR>

endif
