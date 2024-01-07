local present, lspsaga = pcall(require, "lspsaga")

if not present then
    return
end

lspsaga.setup {
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
    },
    code_action = {
        num_shortcut = true,
        keys = {
            -- string |table type
            quit = "q",
            exec = "<CR>",
        },
    },
    request_timeout = 2000,
    finder = {
        keys = {
            edit = { "o", "<CR>" },
            quit = { "q", "<ESC>" },
            vsplit = "v",
            split = "s",
            tabe = "t",
        },
    },
    lightbulb = {
        enable = true,
        sign = true,
        virtual_text = true,
        debounce = 10,
        sign_priority = 40,
    },
    diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        keys = {
            exec_action = "o",
            quit = "q",
            go_action = "g",
        },
        theme = {},
    },
    outline = {
        win_position = "right",
        win_width = 30,
        auto_preview = true,
        detail = true,
        auto_close = true,
        close_after_jump = false,
        auto_refresh = true,
        keys = {
            toggle_or_jump = "o",
            expand_collapse = "u",
            quit = "q",
        },
    },
    symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        color_mode = true,
    },
    ui = {
        -- currently only round theme
        theme = "round",
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = "double",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        colors = {
            --float window normal background color
            normal_bg = "#000000",
            --title background color
            title_bg = "#FF7070",
            red = "#e95678",
            magenta = "#b33076",
            orange = "#FF8700",
            yellow = "#f7bb3b",
            green = "#afd700",
            cyan = "#36d0e0",
            blue = "#61afef",
            purple = "#CBA6F7",
            white = "#d1d4cf",
            black = "#1c1c19",
        },
        kind = {
            ["String"] = { " ", "String" },
        },
    },
}
