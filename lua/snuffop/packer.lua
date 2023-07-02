vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use ({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = {
			{'nvim-lua/plenary.nvim'},
		}
	})

	use ({ 
		'Mofiqul/dracula.nvim',
		as = 'dracula',
		config = function()
			vim.cmd('colorscheme dracula')
		end
	})

	use ({
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' },
	})

	use ({
		'nvim-treesitter/playground',
	})

	use ({
		'theprimeagen/harpoon',
	})

	use ({
		'mbbill/undotree',
	})

	use ({
		'tpope/vim-fugitive'
	})
	
end)
