-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+') 

-- 加载neovid的配置
if vim.fn.exists('g:neovide') then
  require('neovide')
end
