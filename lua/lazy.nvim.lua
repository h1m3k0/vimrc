if vim.g.vscode then
    return
end
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = vim.fn.printf(
        vim.g.plug_url_format or 'https://github.com/%s.git',
        'folke/lazy.nvim'
    )
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = 'plugins' },
        { import = 'plugins/languages' },
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
        rtp = {
            -- 不重置runtimepath, 与plugin vim-plug共用
            reset = false,
        },
    },
    readme = {
        enabled = true,
    },
})
