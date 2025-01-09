" neovide的配置


" 输入法
augroup NeovideIme
  autocmd!
  let g:neovide_input_ime = v:false
  " 插入模式允许使用输入法
  autocmd InsertEnter * let g:neovide_input_ime=v:true
  autocmd InsertLeave * let g:neovide_input_ime=v:false
  function! Neovide_cmd_ime() abort
    let g:neovide_input_ime=v:true
    return ''
  endfunction
  " 命令行模式 搜索时允许使用输入法 命令允许<C-Space>开启输入法
  cnoremap <C-Space> <C-R>=Neovide_cmd_ime()<CR>
  autocmd CmdlineEnter  / let g:neovide_input_ime=v:true
  autocmd CmdlineEnter \? let g:neovide_input_ime=v:true
  autocmd CmdlineLeave  : let g:neovide_input_ime=v:false
  autocmd CmdlineLeave  / let g:neovide_input_ime=v:false
  autocmd CmdlineLeave \? let g:neovide_input_ime=v:false
augroup END

augroup NeovideCool
  " 位置动画长度
  let g:neovide_position_animation_length = 0.15
  " 滚动动画长度
  let g:neovide_scroll_animation_length = 0.3
  " 滚动远线
  let g:neovide_scroll_animation_far_lines = 1
  " 触摸拖动超时 
  let g:neovide_touch_drag_timeout = 0.1
  " 动画长度
  let g:neovide_cursor_animation_length = 0.02
  " 动画轨迹大小
  let g:neovide_cursor_trail_size = 0.5
  " 插入模式下制作动画
  let g:neovide_cursor_animate_in_insert_mode = v:true
  " 切换命令行也有动画
  let g:neovide_cursor_animate_command_line = v:true
  " 光标闪烁动画
  let g:neovide_cursor_smooth_blink = v:true
  " 光标粒子 railgun torpedo pixiedust sonicboom ripple wireframe
  let g:neovide_cursor_vfx_mode = "wireframe"
augroup END
