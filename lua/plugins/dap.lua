-- Debugging (Go via delve; other languages need their own adapter).
-- Drop this whole file if you never step through code.

-- Small wrappers so the keymap table below stays one line per key.
local function dap(fn)
	return function()
		require("dap")[fn]()
	end
end

local function conditional_breakpoint()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end

local function toggle_repl()
	require("dap").repl.toggle()
end

local function toggle_ui()
	require("dapui").toggle()
end

local function debug_test()
	require("dap-go").debug_test() -- runs the test under the cursor
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio", -- dap-ui dependency
			"leoluz/nvim-dap-go", -- also creates the "go" adapter
		},
		keys = {
			{ "<leader>Dc", dap("continue"), desc = "Debug: start/continue" },
			{ "<leader>Dn", dap("step_over"), desc = "Debug: step over" },
			{ "<leader>Di", dap("step_into"), desc = "Debug: step into" },
			{ "<leader>Do", dap("step_out"), desc = "Debug: step out" },
			{ "<leader>Db", dap("toggle_breakpoint"), desc = "Debug: toggle breakpoint" },
			{ "<leader>DB", conditional_breakpoint, desc = "Debug: conditional breakpoint" },
			{ "<leader>Dr", toggle_repl, desc = "Debug: REPL" },
			{ "<leader>Du", toggle_ui, desc = "Debug: toggle UI" },
			{ "<leader>Dq", dap("terminate"), desc = "Debug: terminate" },
			{ "<leader>Dt", debug_test, desc = "Debug: Go test under cursor" },
		},
		config = function()
			require("dap-go").setup({ delve = { path = "dlv" } })

			local dapui = require("dapui")
			dapui.setup()

			-- Open the UI when a session starts, close it when it ends.
			local dap_listeners = require("dap").listeners
			dap_listeners.after.event_initialized["dapui_config"] = dapui.open
			dap_listeners.before.event_terminated["dapui_config"] = dapui.close
			dap_listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}
