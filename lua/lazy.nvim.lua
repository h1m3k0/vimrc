-- Bootstrap lazy.nvim
local rootpath = vim.fn.fnamemodify(vim.fn.getenv('MYVIMRC'), ':h') .. '/lazy'
if not (vim.uv or vim.loop).fs_stat(rootpath .. '/data/lazy.nvim') then
  local lazyrepo = "git@github.com:folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, rootpath .. '/data/lazy.nvim' })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(rootpath .. '/data/lazy.nvim')

-- Setup lazy.nvim
require("lazy").setup({
  root = rootpath .. '/data',
  spec = {
    -- import your plugins
    { import = 'plugin/interface' },
    { import = 'plugin/vim-plug' },
    { import = 'plugin/nvim-plug' },
  },
  lockfile = rootpath .. '/config/lazy-lock.json',
  git = {
    url_format = vim.g.plug_url_format,
  },
  pkg = {
    cache = rootpath .. '/state/pkg-cache.lua',
  },
  rocks = {
    root = rootpath .. '/data/lazy-rocks',
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  readme = {
    root = rootpath .. '/state/lazy/readme',
  },
  state = rootpath .. '/state/state.json',
})
