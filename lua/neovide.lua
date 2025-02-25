-- 初始不允许使用舒服法
vim.g.neovide_input_ime = false

local ime_input = vim.api.nvim_create_augroup('ime_input', { clear = true })

-- 插入模式允许使用输入法
vim.api.nvim_create_autocmd('InsertEnter', {
    group = ime_input,
    pattern = "*",
    callback = function() vim.g.neovide_input_ime = true end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
    group = ime_input,
    pattern = "*",
    callback = function() vim.g.neovide_input_ime = false end,
})
-- 命令行模式
-- 搜索时允许使用输入法
-- 命令允许通过<C-Space>开启输入法
vim.keymap.set('c', '<C-Space>', function() vim.g.neovide_input_ime = true end, { noremap = true })
vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = ime_input,
    pattern = { '/', '?' },
    callback = function() vim.g.neovide_input_ime = true end,
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = ime_input,
    pattern = { ':', '/', '?' },
    callback = function() vim.g.neovide_input_ime = false end,
})

-- 窗口位置改变的动画时间
vim.g.neovide_position_animation_length = 0.075
-- scroll的动画时间
vim.g.neovide_scroll_animation_length = 0.15
-- 滚动远线
vim.g.neovide_scroll_animation_far_lines = 1
-- 触摸拖动超时 
vim.g.neovide_touch_drag_timeout = 0.095
-- 光标移动的动画时间
vim.g.neovide_cursor_animation_length = 0.065
-- 光标移动的拖尾长度
vim.g.neovide_cursor_trail_size = 0
-- 切换命令行也有动画
vim.g.neovide_cursor_animate_command_line = false
-- 光标闪烁动画
vim.g.neovide_cursor_smooth_blink = true
-- 光标粒子 railgun torpedo pixiedust sonicboom ripple wireframe
vim.g.neovide_cursor_vfx_mode = 'wireframe'
