-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
		config = function()
			require('catppuccin').setup {
				flavor = "macchiato",
			}

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
