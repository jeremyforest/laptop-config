return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dap_python = require 'dap-python'

    dapui.setup()

    -- Automatically open/close dap-ui during debugging sessions
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

    -- Configure Python adapter using pipx's debugpy
    dap.adapters.python = {
      type = 'executable',
      command = vim.fn.exepath 'debugpy',
      args = { 'adapter' },
    }
    dap_python.setup(vim.fn.exepath 'python3')

    -- Key mappings for debugging
    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = 'Continue' })
    vim.keymap.set('n', '<Leader>di', dap.step_into, { desc = 'Step Into' })
    vim.keymap.set('n', '<Leader>do', dap.step_out, { desc = 'Step Out' })
    vim.keymap.set('n', '<Leader>ds', dap.step_over, { desc = 'Step Over' })
    vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = 'Open REPL' })
    vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = 'Run Last Debug Configuration' })
  end,
}
