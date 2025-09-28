-- DAP for Go
return {
	"leoluz/nvim-dap-go",
	config = function()
		require("dap-go").setup({
			dap_configurations = {
				type = "go",
				name = "Attatch remote",
				mode = "remote",
				request = "attach",
			},
			delve = {
				path = "dlv",
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = {},
				cwd = nil,
			},
			tests = {
				verbose = false,
			},
		})
	end,
}
