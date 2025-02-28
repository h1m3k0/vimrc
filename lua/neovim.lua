-- 始终显示状态栏(set laststatus=2) 且占满
vim.opt.laststatus = 3
-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+', { noremap = true })
-- 重绘
vim.opt.lazyredraw = false

local diagnostic_level = function()
  local list = vim.diagnostic.get()
  local level = vim.diagnostic.severity.HINT
  for i, diagnostic in pairs(list) do
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      return vim.diagnostic.severity.ERROR
    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
      level = vim.diagnostic.severity.WARN
    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
      level = min(vim.diagnostic.severity.INFO, level)
    end
  end
  return level
end
vim.keymap.set('n', '<F2>', function()
  vim.diagnostic.goto_next({severity = diagnostic_level()})
end)
vim.keymap.set('n', '<S-F2>', function()
  vim.diagnostic.goto_prev({severity = diagnostic_level()})
end)
