local osys = require("cmake-tools.osys")
require("cmake-tools").setup({
    cmake_generate_options = { "-GNinja", "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_directory = function()
        if osys.iswin32 then
            return "build\\${variant:buildType}"
        end
        return "build/${variant:buildType}"
    end,
    cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "cppdbg",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
        setupCommands = {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true,
            },
            {
                description = "Force GDB to load pretty printers",
                text = '-interpreter-exec console "set auto-load safe-path /"',
                ignoreFailures = true,
            },
        },
    },
    cmake_variants_message = {
        short = { show = true }, -- whether to show short message
        long = { show = true, max_length = 40 }, -- whether to show long message
    },
    cmake_executor = { -- executor to use
        name = "toggleterm", -- name of the executor
        opts = {
            toggleterm = {
                direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true, -- whether close the terminal when exit
                auto_scroll = true, -- whether auto scroll to the bottom
                singleton = true, -- single instance, autocloses the opened one, if present
            },
        }, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
    },
    cmake_runner = { -- runner to use
        name = "toggleterm", -- name of the runner
        opts = {
            toggleterm = {
                direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = true, -- whether close the terminal when exit
                auto_scroll = true, -- whether auto scroll to the bottom
                singleton = true, -- single instance, autocloses the opened one, if present
            },
        }, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
    },
    cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
    },
    cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
    cmake_use_scratch_buffer = false, -- A buffer that shows what cmake-tools has done
})
