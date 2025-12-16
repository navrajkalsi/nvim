return {
	"mfussenegger/nvim-dap",

	dependencies = {
		{ "rcarriga/nvim-dap-ui", opts = {} },
		"nvim-neotest/nvim-nio",
	},

	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "[D]ebug [B]reak",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "[D]ebug [C]ontinue",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "[D]ebug Step [I]nto",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "[D]ebug Step [O]ver",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
			desc = "[D]ebug Step [O]ut",
		},
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		if vim.fn.executable("gdb") ~= 1 then
			vim.notify("gdb not found", vim.log.levels.WARN)
			return
		end

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = {}, -- provide arguments if needed
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				pid = function()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach to gdbserver :1234",
				type = "gdb",
				request = "attach",
				target = "localhost:1234",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
			},
		}
	end,
}
