vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.conceallevel = 2

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.o.winborder = "rounded"
vim.o.winblend = 5


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.opt.foldenable = true

vim.opt.foldcolumn = "1"

vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    foldinner = " ",
}
