local present, hlchunk = pcall(require, "hlchunk")

if not present then
    return
end

hlchunk.setup {
    chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        style = {
            { fg = "#806D9C" },
        },
    },

    indent = {
        enable = false,
        use_treesitter = true,
        chars = {
            "│",
        },
        style = {
            "#FF0000",
            "#FF7F00",
            "#FFFF00",
            "#00FF00",
            "#00FFFF",
            "#0000FF",
            "#8B00FF",
        },
    },

    line_num = {
        enable = false,
        use_treesitter = true,
        style = "#806D9C",
    },

    blank = {
        enable = false,
        chars = {
            " ",
        },
        style = {
            { bg = "argb:", fg = "" },
            { bg = "rgba(243, 114, 44, 0.125)", fg = "" },
            { bg = "rgba(248, 150, 30, 0.125)", fg = "" },
            { bg = "rgba(249, 132, 74, 0.125)", fg = "" },
            { bg = "rgba(249, 199, 79, 0.125)", fg = "" },
            { bg = "rgba(144, 190, 109, 0.125)", fg = "" },
            { bg = "rgba(67, 170, 139, 0.125)", fg = "" },
        },
    },

    exclude_filetypes = {
        "floaterm",
    },
}
