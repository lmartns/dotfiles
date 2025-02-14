return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },  -- Dependência necessária
	version = "*",
	config = function()
	  require("bufferline").setup({
		options = {
		  mode = "tabs",
		  separator_style = "slant",
		},
	  })
	end
  }
  