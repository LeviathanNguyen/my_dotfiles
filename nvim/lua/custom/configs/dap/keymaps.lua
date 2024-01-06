local M = {}

local whichkey = require "which-key"

function M.setup()
    local keymap = {
        d = {
            name = "Debug",
            R = { "<CMD>lua require'dap',run_to_cursor()<CR>", "Run To Cursor" },
            E = { "<CMD>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>", "Evaluate Input" },
            C = { "<CMD>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>", "Conditional Breakpoint" },
            U = { "<CMD>lua require'dapui'.toggle()<cr>", "Toggle UI" },
            b = { "<CMD>lua require'dap'.step_back()<cr>", "Step Back" },
            c = { "<CMD>lua require'dap'.continue()<cr>", "Continue" },
            d = { "<CMD>lua require'dap'.disconnect()<cr>", "Disconnect" },
            e = { "<CMD>lua require'dapui'.eval()<cr>", "Evaluate" },
            g = { "<CMD>lua require'dap'.session()<cr>", "Get Session" },
            h = { "<CMD>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
            S = { "<CMD>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
            i = { "<CMD>lua require'dap'.step_into()<cr>", "Step Into" },
            o = { "<CMD>lua require'dap'.step_over()<cr>", "Step Over" },
            p = { "<CMD>lua require'dap'.pause.toggle()<cr>", "Pause" },
            q = { "<CMD>lua require'dap'.close()<cr>", "Quit" },
            r = { "<CMD>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            s = { "<CMD>lua require'dap'.continue()<cr>", "Start" },
            t = { "<CMD>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            x = { "<CMD>lua require'dap'.terminate()<cr>", "Terminate" },
            u = { "<CMD>lua require'dap'.step_out()<cr>", "Step Out" },
        },
    }
    whichkey.register(keymap, {
        mode = "n",
        prefix = "<LEADER>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    })

    local keymap_v = {
        name = "Debug",
        e = { "<CMD>lua require'dapui'.eval()<CR>", "Evaluate" },
    }
    whichkey.register(keymap_v, {
        mode = "v",
        prefix = "<LEADER>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
    })
end

return M
