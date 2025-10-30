vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1 

vim.opt.termguicolors = true


require("colorizer").setup()
require("nvim-tree").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "bash", "python", "typescript", "tsx", "cpp" },

    highlight = {
	enable = true
    }
})
