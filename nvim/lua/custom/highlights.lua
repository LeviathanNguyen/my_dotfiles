-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

-- @type Base46HLGroupsList
M.override = {
    Comment = {
        italic = true,
    },
    AlphaHeader = {
        fg = "blue",
    },
    IlluminatedWordText = {
        bg = "#353941",
    },
    HlSearchLens = {
        bg = "red",
    },
    NeoTreeTabActive = {
        bg = "none",
        fg = "red",
    },
    NeoTreeTabInactive = {
        bg = "#000000",
        fg = "#666771",
    },
    NotifyBackground = {
        bg = "red",
    },
}

-- @type HLTable
M.add = {
    NvimTreeOpenedFolderName = {
        fg = "green",
        bold = true,
    },
    AlphaHeader = {
        fg = "blue",
    },
    IndentBlanklineIndent1 = {
        fg = "#E06C75",
        bold = true,
    },
    IndentBlanklineIndent2 = {
        fg = "#E5C07B",
        bold = true,
    },
    IndentBlanklineIndent3 = {
        fg = "#98C379",
        bold = true,
    },
    IndentBlanklineIndent4 = {
        fg = "#56B6C2",
        bold = true,
    },
    IndentBlanklineIndent5 = {
        fg = "#61AFEF",
        bold = true,
    },
    IndentBlanklineIndent6 = {
        fg = "#C678DD",
        bold = true,
    },
    NotifyBackground = {
        bg = "red",
    },
}

return M
