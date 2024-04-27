return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- ui
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- go debugger
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }
    require('dapui').setup()

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

    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = '[D]ebuging [T]oggle breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[D]ebuging [C]ontinue' })
    vim.keymap.set('n', '<Leader>ds', dap.step_over, { desc = '[D]ebuging [S]tep over' })
    vim.keymap.set('n', '<Leader>di', dap.step_into, { desc = '[D]ebuging [I]nto' })
    vim.keymap.set('n', '<Leader>do', dap.step_out, { desc = '[D]ebuging [O]ut' })
    vim.keymap.set('n', '<Leader>de', dap.disconnect, { desc = '[D]ebuging [E]nd' })
    vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = '[D]ebuging [R]epl' })
    vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = '[D]ebuging [L]ast' })
    vim.keymap.set('n', '<Leader>dO', dapui.open, { desc = '[D]ebug [O]pen' })
    vim.keymap.set('n', '<Leader>dC', dapui.close, { desc = '[D]ebug [C]lose' })
    vim.keymap.set('n', '<Leader>dt', dapui.toggle, { desc = '[D]ebug [T]oggle' })

    require('dap-go').setup()
  end,
}
