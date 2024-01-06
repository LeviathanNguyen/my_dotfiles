-- @type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "Enter Command Mode", opts = { nowait = true } },
    },

    v = {
        [">"] = { ">gv", "Forward Indent" },
        ["<"] = { "<gv", "Backward Indent" },
    },
}

M.navigation = {
    n = {
        ["H"] = { "^", "Begin of Line" },
        ["L"] = { "$", "End of Line" },
    },
}

M.SaveFile = {
    n = {
        ["<C-s>"] = { "<ESC>:w <CR>", "Save File in --NORMAL-- Mode", opts = { silent = true } },
    },

    i = {
        ["<C-s>"] = { "<ESC>:w <CR>", "Save File in --INSERT-- Mode", opts = { silent = true } },
    },
}

M.projects = {
    n = {
        ["<C-p>"] = { "<CMD>Telescope project <CR>", "Switch Projects" },
    },
}

M.Aerial = {
    n = {
        ["<LEADER>a"] = { "<CMD>AerialToggle! <CR>", "Toggle Aerial" },
        ["{"] = { "<cmd>AerialPrev <CR>", "Aerial Previous" },
        ["}"] = { "<cmd>AerialNext <CR>", "Aerial Next" },
        ["[["] = { "<cmd>AerialPrevUp <CR>", "Aerial Prev Up Tree" },
        ["]]"] = { "<cmd>AerialNextUp <CR>", "Aerial Next Up Tree" },
    },
}

M.Treesitter = {
    n = {
        ["<LEADER>cu"] = { "<CMD>TSCaptureUnderCursor <CR>", "Find Media" },
    },
}

M.Shade = {
    n = {
        ["<LEADER>s"] = {
            function()
                require("shade").toggle()
            end,
            "Toggle Shade",
        },
    },
}

M.BufferLine = {
    n = {
        ["<A-.>"] = { "<CMD> BufferLineCycleNext<CR>", "Next Buffer", opts = { silent = true } },
        ["<A-,>"] = { "<CMD> BufferLineCyclePrev<CR>", "Previous Buffer", opts = { silent = true } },
        ["<A-1>"] = { "<CMD> BufferLineGoToBuffer 1<CR>", "Goto buffer 1", opts = { silent = true } },
        ["<A-2>"] = { "<CMD> BufferLineGoToBuffer 2<CR>", "Goto buffer 2", opts = { silent = true } },
        ["<A-3>"] = { "<CMD> BufferLineGoToBuffer 3<CR>", "Goto buffer 3", opts = { silent = true } },
        ["<A-4>"] = { "<CMD> BufferLineGoToBuffer 4<CR>", "Goto buffer 4", opts = { silent = true } },
        ["<A-5>"] = { "<CMD> BufferLineGoToBuffer 5<CR>", "Goto buffer 5", opts = { silent = true } },
        ["<A-6>"] = { "<CMD> BufferLineGoToBuffer 6<CR>", "Goto buffer 6", opts = { silent = true } },
        ["<A-7>"] = { "<CMD> BufferLineGoToBuffer 7<CR>", "Goto buffer 7", opts = { silent = true } },
        ["<A-8>"] = { "<CMD> BufferLineGoToBuffer 8<CR>", "Goto buffer 8", opts = { silent = true } },
        ["<A-9>"] = { "<CMD> BufferLineGoToBuffer 9<CR>", "Goto buffer 9", opts = { silent = true } },
        ["<A-0>"] = { "<CMD> BufferLineGoToBuffer -1<CR>", "Goto last buffer", opts = { silent = true } },
    },
}

M.Far = {
    n = {
        ["<A-f>"] = {
            function()
                require("custom.configs.far").findInput()
            end,
            "Find & Replace",
        },
    },

    i = {
        ["<A-f>"] = {
            function()
                require("custom.configs.far").findInput()
            end,
            "Find & Replace",
        },
    },
}

M.Hop = {
    n = {
        ["<leader>hl"] = { ":HopLineStart<CR>" },
        ["<leader>hw"] = { ":HopWordCurrentLine<CR>" },
    },
}

M.NeoTree = {
    n = {
        ["<C-b>"] = { "<CMD> NeoTreeRevealToggle <CR>", "Toggle NeoTree", opts = { silent = true } },
        ["<leader>e"] = { "<CMD> NeoTreeFloatToggle <CR>", "Toggle Float NeoTree", opts = { silent = true } },
    },

    i = {
        ["<C-b>"] = { "<CMD> NeoTreeRevealToggle <CR>", "Toggle NeoTree", opts = { silent = true } },
    },
}

M.Trouble = {
    n = {
        ["<A-m>"] = { ":TroubleToggle <CR>", "Open trouble window" },
    },
}

M.Telescope = {
    n = {
        ["<leader>ft"] = { ":TodoTelescope<CR>", "  Open Todo Telescope" },
    },
}

M.lspconfig = {
    plugin = true,

    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gh"] = {
            "<cmd>Lspsaga lsp_finder<CR>",
            "lsp finder",
            opts = {
                silent = true,
            },
        },
        ["gd"] = {
            "<cmd>Lspsaga peek_definition<CR>",
            "lsp finder",
            opts = {
                silent = true,
            },
        },
        ["<leader>o"] = {
            "<cmd>LSoutlineToggle<CR>",
            "lspsaga outline",
            opts = {
                silent = true,
            },
        },
        ["<C-[>"] = {
            "<cmd>Lspsaga diagnostic_jump_prev<CR>",
            "goto prev",
            opts = {
                silent = true,
            },
        },
        ["<C-]>"] = {
            "<cmd>Lspsaga diagnostic_jump_next<CR>",
            "goto next",
            opts = {
                silent = true,
            },
        },
        ["K"] = {
            "<cmd>Lspsaga hover_doc<CR>",
            "lspsaga hover doc",
            opts = {
                silent = true,
            },
        },
        ["<leader>f"] = {
            "<cmd>Lspsaga show_cursor_diagnostics<CR>",
            "Lspsaga show diagnostic",
            opts = {
                silent = true,
            },
        },
        ["<leader>ca"] = {
            "<cmd>Lspsaga code_action<CR>",
            "Lspsaga code action",
            opts = {
                silent = true,
            },
        },
        ["<leader>rn"] = {
            "<cmd>lua require('custom.configs.nui_lsp').lsp_rename()<CR>",
            "LSP Rename",
            opts = {
                silent = true,
            },
        },
    },
}

M.Floaterm = {
    n = {
        ["<F12>"] = {
            ":FloatermToggle <CR>",
            "Toggle Float Terminal",
            opts = {
                silent = true,
            },
        },
    },

    t = {
        ["<ESC>"] = {
            "<C-x> :FloatermToggle <CR>",
            "Toggle Float Terminal",
            opts = {
                silent = true,
            },
        },
    },
}

M.Move = {
    n = {
        ["<A-j>"] = { ":MoveLine(1) <CR>", "Move A Line Down", opts = { silent = true } },
        ["<A-k>"] = { ":MoveLine(-1) <CR>", "Move A Line UP", opts = { silent = true } },
        ["<A-l>"] = { ":MoveWord(1) <CR>", "Move The Word Under The Cursor To Right", opts = { silent = true } },
        ["<A-h>"] = { ":MoveWord(-1) <CR>", "Move The Word Under The Cursor To Left", opts = { silent = true } },
    },

    v = {
        ["<A-j>"] = { ":MoveBlock(1) <CR>", "Move A Selected Block Down", opts = { silent = true } },
        ["<A-k>"] = { ":MoveBlock(-1) <CR>", "Move A Selected Block Up", opts = { silent = true } },
        ["<A-l>"] = { ":MoveHBlock(1) <CR>", "Move A Visual Area To Right", opts = { silent = true } },
        ["<A-h>"] = { ":MoveHBlock(-1) <CR>", "Move A Visual Area To Left", opts = { silent = true } },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<LEADER>db"] = { "<CMD>DapToggleBreakpoint <CR>" },
    },
}

M.dap_python = {
    plugin = true,
    n = {
        ["<LEADER>dpr"] = {
            function()
                require("dap-python").test_method()
            end,
        },
    },
}

return M
