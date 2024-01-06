local present, trouble = pcall(require, "trouble")

if not present then
    return
end

trouble.setup {
    position = "bottom",
    height = 10,
    width = 50,
    icons = true,
    mode = "workspace_diagnostics",
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true,
    padding = true,
    action_keys = {
        close = "q",
        cancel = "<Esc>",
        refresh = "r",
        jump = { "<CR>", "<Tab>" },
        open_split = { "<C-x>" },
        open_vsplit = { "<C-v>" },
        open_tab = { "<C-t>" },
        jump_close = { "o" },
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_folds = { "zA", "za" },
        previous = "k",
        next = "j",
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { "lsp_definitions" },
    signs = {
        error = " ",
        warning = " ",
        hint = "",
        information = " ",
        other = "﫠",
    },
    use_diagnostic_signs = false,
}
