-- Bootstrap lazy.nvim
local rootpath = vim.env.MYVIMDIR .. '/lazy'
if not vim.uv.fs_stat(rootpath .. '/lazy.nvim') then
  local lazyrepo = "git@github.com:folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, rootpath .. '/lazy.nvim' })
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
vim.opt.rtp:prepend(rootpath .. '/lazy.nvim')

require("lazy").setup({
  root = rootpath,
  spec = {
    { import = 'plugins' },
  },
  install = {
    colorscheme = { 'everforest', 'habamax' },
  },
  git = {
    url_format = vim.g.plug_url_format,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  performance = {
    reset_packpath = false,
  },
})
