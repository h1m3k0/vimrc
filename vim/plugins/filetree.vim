Plug 'preservim/nerdtree' " => 文件树
" 切换目录时自动切换vim根目录
let g:NERDTreeChDirMode = 2
" 取消顶部UI
let g:NERDTreeMinimalUI = 1
" 将CD改为cD
let g:NERDTreeMapCWD = 'cD'
nnoremap <Leader>e <Esc>:<C-U>NERDTree
nnoremap <silent> <Leader>ef <Esc>:<C-U>NERDTreeFind<CR>
nnoremap <silent> <Leader>eF <Esc>:<C-U>NERDTreeFind<CR>:NERDTreeVCS<CR>
nnoremap <silent> <Leader>ee <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <silent> <Leader>et <Esc>:<C-U>NERDTreeMirror<CR>:NERDTreeToggle<CR>
nnoremap <silent> <Leader>ev <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR><CR>
nnoremap <silent> <Leader>eh <Esc>:<C-U>NERDTree $HOME<CR>
nnoremap <silent> <Leader>ep <Esc>:<C-U>NERDTree <C-R>=g:vimdir<CR>/plugged<CR>

if v:version >= 800 && executable('git') " => NERDTree+Git
    Plug 'Xuyuanp/nerdtree-git-plugin'
    if g:config_nerdfont
        let g:NERDTreeGitStatusUseNerdFonts = 1
    endif
    let g:NERDTreeGitStatusShowIgnored = 1
endif
if g:config_nerdfont
    Plug 'ryanoasis/vim-devicons'  " => 图标
endif
