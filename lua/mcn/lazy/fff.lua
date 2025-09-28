return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- this will download prebuild binary or try to use existing rustup toolchain to build from source
		-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
		require("fff.download").download_or_build_binary()
	end,
	config = function()
		require("fff").setup({
			prompt = "> ",
			title = "Find files",
			preview = {
				show_file_info = false,
			},
		})
	end,
	-- if you are using nixos
	-- build = "nix run .#release",
	opts = { -- (optional)
		debug = {
			enabled = false,
			show_scores = false,
		},
	},
	-- No need to lazy-load with lazy.nvim.
	-- This plugin initializes itself lazily.
	lazy = false,
	keys = {
		{
			"ff", -- try it if you didn't it is a banger keybinding for a picker
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
	},
}
