local dap = require("dap")
dap.configurations.python = {
    {
        name = "Python",
        type = "python",
        request = "launch",
        justMyCode = false,
        program = "${file}",
    },
}
