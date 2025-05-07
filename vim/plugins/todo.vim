vim9script
Plug 'mg979/vim-visual-multi' # 多光标
g:VM_maps = {
    'Undo': 'u',     # 增强VM的撤销(原生undo会有问题)
    'Redo': '<C-r>', # 增强VM的撤销(原生redo会有问题)
    'Find Under':      '<A-n>',          # 单词
    'Add Cursor Down': '<A-Down>',       # 字符
    'Add Cursor Up':   '<A-Up>',         # 字符
    'Mouse Cursor':    '<A-LeftMouse>',  # 字符
    'Mouse Word':      '<A-RightMouse>', # 单词
    'Switch Mode':     '<Tab>',
}

# Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }


Plug 'lambdalisue/vim-fern'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
var preview_obj = {
  options: [
    '--layout=reverse',
    '--info=inline',
    '--preview',
    (has('win32') ? 'more' : 'cat') .. ' {}'
  ]
}
# Files 预览
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(
      \   <q-args>,
      \   preview_obj,
      \   <bang>0)
# GFiles 预览
command! -bang -nargs=? GFiles
      \ call fzf#vim#gitfiles(
      \   <q-args>,
      \   fzf#vim#with_preview(extendnew(preview_obj, <q-args> == '?' ? { 'placeholder': '' } : {})),
      \   <bang>0)
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep2(
      \   'git grep --line-number -- ',
      \   <q-args>,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <Leader>ff <CMD>Files<CR>
nnoremap <Leader>fF <CMD>GFiles<CR>
nnoremap <Leader>fg <CMD>RG<CR>
nnoremap <Leader>fG <CMD>GGrep<CR>
