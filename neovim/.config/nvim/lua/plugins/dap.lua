return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- Installs the debug adapters for you
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Add your own debuggers here
    "leoluz/nvim-dap-go",

    -- JavaScript/TypeScript debugger
    "mxsdev/nvim-dap-vscode-js",
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F1>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F2>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F3>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: Set Breakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dapui").toggle()
      end,
      desc = "Debug: See last session result.",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "delve",
        "js-debug-adapter",
        "node-debug2-adapter",
      },
    })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    require("dap-go").setup({
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has("win32") == 0,
      },
    })

    -- JavaScript/TypeScript Debug Adapter Setup
    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path to node.js (if not in PATH)
      debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
      debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })

    -- JavaScript/TypeScript configurations
    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        -- Node.js debugging
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Node.js",
          program = "${file}",
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Node.js",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
        },
        -- Next.js debugging
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Next.js (dev)",
          program = "${workspaceFolder}/node_modules/.bin/next",
          args = { "dev" },
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
          env = {
            NODE_OPTIONS = "--inspect",
          },
        },
        -- NestJS debugging
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch NestJS",
          program = "${workspaceFolder}/src/main.ts",
          args = {},
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
          runtimeArgs = { "-r", "ts-node/register", "-r", "tsconfig-paths/register" },
          env = {
            NODE_ENV = "development",
          },
        },
        -- Jest testing
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          program = "${workspaceFolder}/node_modules/.bin/jest",
          args = { "--runInBand", "--no-coverage", "${relativeFile}" },
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        -- React debugging (via Chrome)
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch React in Chrome",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}/src",
          skipFiles = { "<node_internals>/**" },
        },
        -- Attach to existing Chrome instance
        {
          type = "pwa-chrome",
          request = "attach",
          name = "Attach to Chrome",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          skipFiles = { "<node_internals>/**" },
        },
      }
    end

    -- TypeScript React (.tsx) configurations
    dap.configurations["typescriptreact"] = dap.configurations["typescript"]
    -- JavaScript React (.jsx) configurations
    dap.configurations["javascriptreact"] = dap.configurations["javascript"]
  end,
}
