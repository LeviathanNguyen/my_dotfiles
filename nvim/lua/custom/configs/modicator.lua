local present, modicator = pcall(require, "modicator")

if not present then
    return
end

-- NOTE: Modicator requires line_numbers and cursorline to be enabled
modicator.setup {
    -- Show warning if any required option is missing
    show_warnings = false,
    highlights = {
        -- Default options for bold/italic. You can override these individually
        -- for each mode if you'd like as seen below.
        defaults = {
            bold = true,
            italic = true,
        },
    },
    vim.api.nvim_set_hl(0, "NormalMode", { foreground = "#AF60AF" }),
    vim.api.nvim_set_hl(0, "InsertMode", { foreground = "#22FF22" }),
    vim.api.nvim_set_hl(0, "VisualMode", { foreground = "#7766FF" }),
    vim.api.nvim_set_hl(0, "CommandMode", { foreground = "#EE4A59" }),
    vim.api.nvim_set_hl(0, "ReplaceMode", { foreground = "#FFA6FF" }),
    vim.api.nvim_set_hl(0, "SelectMode", { foreground = "#2BFF99" }),
}
