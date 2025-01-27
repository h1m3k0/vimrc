-- Bootstrap lazy.nvim
local rootpath = vim.fn.getenv('MYVIMDIR')..'/local/lazy'
if not (vim.uv or vim.loop).fs_stat(rootpath .. '/plugins/lazy.nvim') then
  local lazyrepo = "git@github.com:folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, rootpath .. '/plugins/lazy.nvim' })
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
vim.opt.rtp:prepend(rootpath .. '/plugins/lazy.nvim')

-- Setup lazy.nvim
require("lazy").setup({
  root = rootpath .. '/plugins',
  spec = {
    -- import your plugins
    { import = 'plugins/interface' },
    { import = 'plugins/vim-plugs' },
    { import = 'plugins/nvim-plugs' },
  },
  lockfile = rootpath .. '/lazy-lock.json',
  git = {
    url_format = vim.g.plug_url_format,
  },
  pkg = {
    cache = rootpath .. '/pkg-cache.lua',
  },
  rocks = {
    root = rootpath .. '/plugins/lazy-rocks',
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  readme = {
    root = rootpath .. '/readme',
  },
  state = rootpath .. '/state.json',
})
