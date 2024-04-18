return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dapui').setup()
    require('dap-go').setup()

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
  end,
}
