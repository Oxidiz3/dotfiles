return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      {
        "nvim-neotest/nvim-nio",
        lazy = false,
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          ensure_installed = { "coreclr" },
        },
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/"
      local netcoredbg = mason_bin .. (vim.fn.has "win32" == 1 and "netcoredbg.cmd" or "netcoredbg")
      if vim.fn.executable(netcoredbg) == 0 then
        netcoredbg = vim.fn.exepath "netcoredbg"
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = netcoredbg,
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET assembly",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to .NET assembly: ",
              vim.fn.getcwd() .. "/bin/Debug/",
              "file"
            )
          end,
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.after.event_exited.dapui_config = function()
        dapui.close()
      end

      local map = vim.keymap.set
      map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      map("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
      map("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
      map("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
      map("n", "<S-F11>", dap.step_out, { desc = "Debug: Step out" })
      map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
    end,
  },
}
