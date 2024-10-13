
local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "/usr/bin/gdb",
  args = { "--quiet", "--interpreter=dap" },
}

dap.configurations.python = {
    {
      type = 'python';
      request = 'launch';
      name = "Launch file";
      program = "${file}";
      pythonPath = function()
         return '/usr/bin/python'
       end;
    },
}

dap.configurations.cpp = {

    {
        name = 'Run executable (GDB)',
        type = 'gdb',
        request = 'launch',
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
    },
    {
        name = 'Run executable with arguments (GDB)',
        type = 'gdb',
        request = 'launch',
        program = function()
            local path = vim.fn.input({
                prompt = 'Path to executable: ',
                default = vim.fn.getcwd() .. '/',
                completion = 'file',
            })

            return (path and path ~= '') and path or dap.ABORT
        end,
        args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
        end,
    },
    {
        name = 'Attach to process (GDB)',
        type = 'gdb',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },

}

if vim.fn.executable('/usr/bin/gdb') == 1 then
    require('plugins.dap.c')
    require("noice").redirect("Loading C pluggings")
end
