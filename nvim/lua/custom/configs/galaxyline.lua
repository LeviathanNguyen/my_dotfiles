-- {{/* IMPORTS */}} --
local present, galaxyline = pcall(require, "galaxyline")
if not present then
    return
end

local get_file_icon_color = require("galaxyline/provider_fileinfo").get_file_icon_color
local section = galaxyline.section

-- {{/* CONSTANTS */}} --
local _COLORS = {
    black = { "#000000", 0, "black" },
    gray = { "#808080", 244, "gray" },
    gray_dark = { "#353535", 236, "darkgrey" },
    gray_darker = { "#505050", 244, "gray" },
    gray_light = { "#C0C0C0", 251, "gray" },
    charade = { "#212C3A", 58, "charade" },
    white = { "#FFFFFF", 15, "white" },

    tan = { "#F4C069", 180, "darkyellow" },

    red = { "#EE4A59", 196, "red" },
    red_dark = { "#A80000", 124, "darkred" },
    red_light = { "#FF4090", 203, "red" },

    orange = { "#FF8900", 208, "darkyellow" },
    orange_light = { "#F0AF00", 214, "yellow" },

    yellow = { "#F0DF33", 220, "yellow" },

    green_dark = { "#70D533", 83, "darkgreen" },
    green = { "#22FF22", 72, "green" },
    green_light = { "#99FF99", 72, "green" },
    turquoise = { "#2BFF99", 33, "green" },

    blue = { "#7766FF", 63, "blue" },
    cyan = { "#33DBC3", 87, "cyan" },
    ice = { "#95C5FF", 63, "cyan" },
    teal = { "#60AFFF", 38, "darkblue" },

    magenta = { "#D5508F", 126, "magenta" },
    magenta_dark = { "#BB0099", 126, "darkmagenta" },
    pink = { "#FFA6FF", 162, "magenta" },
    pink_light = { "#FFB7B7", 38, "white" },
    purple = { "#CF55F0", 129, "magenta" },
    purple_light = { "#AF60AF", 63, "magenta" },
}

_COLORS.bar = { middle = _COLORS.charade, side = _COLORS.black }
_COLORS.text = _COLORS.gray_light

-- hex color subtable
local _HEX_COLORS = setmetatable({
    ["bar"] = setmetatable({}, {
        ["__index"] = function(_, key)
            return _COLORS.bar[key] and _COLORS.bar[key][1] or nil
        end,
    }),
}, {
    ["__index"] = function(_, key)
        local color = _COLORS[key]
        return color and color[1] or nil
    end,
})

local _MODES = {
    ["c"] = { "COMMAND-LINE", "#EE4A59" },
    ["ce"] = { "NORMAL EX", "#A80000" },
    ["cv"] = { "EX", "#FF4090" },
    ["i"] = { "INSERT", "#22FF22" },
    ["ic"] = { "INS-COMPLETE", "#99FF99" },
    ["n"] = { "NORMAL", "#AF60AF" },
    ["no"] = { "OPERATOR-PENDING", "#CF55F0" },
    ["r"] = { "HIT-ENTER", "#33D533" },
    ["r?"] = { ":CONFIRM", "#33D533" },
    ["rm"] = { "--MORE", "#33D533" },
    ["R"] = { "REPLACE", "#FFA6FF" },
    ["Rv"] = { "VIRTUAL", "#FFA6FF" },
    ["s"] = { "SELECT", "#2BFF99" },
    ["S"] = { "SELECT", "#2BFF99" },
    ["␓"] = { "SELECT", "#2BFF99" },
    ["t"] = { "TERMINAL", "#FF8900" },
    ["v"] = { "VISUAL", "#7766FF" },
    ["V"] = { "VISUAL LINE", "#7766FF" },
    ["␖"] = { "VISUAL BLOCK", "#7766FF" },
    ["!"] = { "SHELL", "#F0DF33" },

    -- libmodal
    ["TABS"] = "#F4C069",
    ["BUFFERS"] = "#60AFFF",
    ["TABLES"] = "#F0AF00",
}

local _SEPARATOR = {
    left = "",
    right = "",
}

-- {{/* PROVIDERS */}} --
local function buffer_not_empty()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
end

local function checkwidth()
    return vim.fn.winwidth(0) > 80
end

local function check_git_workspace()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
end

local function printer(str)
    return function()
        return str
    end
end

local space = printer " "

-- {{/* CONFIG */}} --
galaxyline.short_line_list = {
    "dbui",
    "diff",
    "help",
    "NvimTree",
    "neo-tree",
    "tagbar",
    "packer",
    "peekaboo",
    "undotree",
    "vista",
    "vista_markdown",
    "lazy",
    "nui",
    "alpha",
    "scratch",
    "nofile",
    "prompt",
    "nvcheatsheet",
    "checkhealth",
}

section.left = {
    {
        ViMode = {
            provider = function()
                -- -- auto change color arcording the vim mode
                local mode_color = nil
                local mode_name = nil

                if vim.g.libmodalActiveModeName then
                    mode_name = vim.g.libmodalActiveModeName
                    mode_color = _MODES[mode_name]
                else
                    local current_mode = _MODES[vim.fn.mode(true)] or _MODES[vim.fn.mode(false)]

                    mode_name = current_mode[1]
                    mode_color = current_mode[2]
                end

                vim.api.nvim_command("hi GalaxyViMode gui=bold guibg=black guifg=" .. mode_color)

                return mode_name .. " "
            end,
            icon = "▊ ",
            separator = _SEPARATOR.right,
            separator_highlight = { _HEX_COLORS.bar.side, get_file_icon_color },
        },
    },

    {
        FileIcon = {
            provider = { space, "FileIcon" },
            condition = buffer_not_empty,
            highlight = { _HEX_COLORS.bar.side, get_file_icon_color },
            separator = _SEPARATOR.left,
            separator_highlight = { _HEX_COLORS.bar.side, get_file_icon_color },
        },
    },

    {
        FileName = {
            provider = { space, "FileName", "FileSize" },
            condition = buffer_not_empty,
            highlight = { _HEX_COLORS.text, _HEX_COLORS.bar.side, "bold" },
        },
    },

    {
        GitSeparator = {
            provider = printer(_SEPARATOR.right),
            condition = check_git_workspace,
            highlight = { _HEX_COLORS.bar.side, _HEX_COLORS.green_dark },
        },
    },

    {
        GitBranch = {
            provider = "GitBranch",
            icon = "   ",
            condition = check_git_workspace,
            highlight = { _HEX_COLORS.bar.side, _HEX_COLORS.green_dark, "bold" },
            separator = _SEPARATOR.left,
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.green_dark },
        },
    },

    {
        LeftEnd = {
            provider = printer(_SEPARATOR.left),
            condition = function()
                return not check_git_workspace()
            end,
            highlight = {
                _HEX_COLORS.bar.middle,
                check_git_workspace() and _HEX_COLORS.green_dark or _HEX_COLORS.bar.side,
            },
        },
    },

    {
        DiffAdd = {
            provider = "DiffAdd",
            condition = function()
                return checkwidth() and check_git_workspace()
            end,
            icon = "  ",
            highlight = { _HEX_COLORS.green_light, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiffModified = {
            provider = "DiffModified",
            condition = checkwidth,
            icon = " ",
            highlight = { _HEX_COLORS.orange_light, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiffRemove = {
            provider = "DiffRemove",
            condition = checkwidth,
            icon = " ",
            highlight = { _HEX_COLORS.red_light, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiagnosticError = {
            provider = "DiagnosticError",
            icon = "  ",
            highlight = { _HEX_COLORS.red, _HEX_COLORS.bar.middle },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiagnosticWarn = {
            provider = "DiagnosticWarn",
            icon = " ",
            highlight = { _HEX_COLORS.yellow, _HEX_COLORS.bar.middle },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiagnosticHint = {
            provider = "DiagnosticHint",
            icon = "󰌵 ",
            highlight = { _HEX_COLORS.magenta, _HEX_COLORS.bar.middle },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.middle },
        },
    },

    {
        DiagnosticInfo = {
            provider = "DiagnosticInfo",
            icon = " ",
            highlight = { _HEX_COLORS.white, _HEX_COLORS.bar.middle },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.middle },
        },
    },
}

section.mid = {
    {
        ShowLspClient = {
            provider = "GetLspClient",
            condition = function()
                local tbl = { ["dashboard"] = true, [""] = true }
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
            icon = "  LSP: ",
            highlight = { _HEX_COLORS.cyan, _HEX_COLORS.bar.middle, "bold" },
        },
    },
}

section.right = {
    {
        RightBegin = {
            provider = space,
            highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.side },
            separator = _SEPARATOR.right,
            separator_highlight = { _HEX_COLORS.bar.middle, _HEX_COLORS.bar.side },
        },
    },

    {
        FileFormat = {
            provider = { "FileFormat", space },
            condition = checkwidth,
            highlight = { _HEX_COLORS.text, _HEX_COLORS.bar.side, "bold" },
        },
    },

    {
        FileType = {
            provider = "FileTypeName",
            highlight = { _HEX_COLORS.black, get_file_icon_color, "bold" },
            separator = _SEPARATOR.left,
            separator_highlight = { get_file_icon_color, _HEX_COLORS.bar.side },
        },
    },

    {
        FileSep = {
            provider = printer(_SEPARATOR.right),
            highlight = { get_file_icon_color, _HEX_COLORS.bar.side },
        },
    },

    {
        LineNumber = {
            provider = function()
                return " " .. vim.api.nvim_win_get_cursor(0)[1]
            end,
            condition = buffer_not_empty,
            highlight = { _HEX_COLORS.text, _HEX_COLORS.bar.side },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.side, _HEX_COLORS.bar.side },
        },
    },

    {
        ColumnNumber = {
            provider = function()
                return " " .. (vim.api.nvim_win_get_cursor(0)[2] + 1)
            end,
            condition = buffer_not_empty,
            highlight = { _HEX_COLORS.text, _HEX_COLORS.bar.side },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.side, _HEX_COLORS.bar.side },
        },
    },

    {
        PerCentSeparator = {
            provider = printer(_SEPARATOR.left),
            highlight = { _HEX_COLORS.magenta_dark, _HEX_COLORS.bar.side },
            separator = " ",
            separator_highlight = { _HEX_COLORS.bar.side, _HEX_COLORS.bar.side },
        },
    },

    {
        PerCent = {
            provider = "LinePercent",
            highlight = { _HEX_COLORS.white, _HEX_COLORS.magenta_dark },
        },
    },

    {
        ScrollBar = {
            provider = "ScrollBar",
            highlight = { _HEX_COLORS.gray, _HEX_COLORS.magenta_dark },
        },
    },
}

section.short_line_left = {
    {
        BufferType = {
            provider = { space, space, "FileTypeName", space },
            highlight = { _HEX_COLORS.black, _HEX_COLORS.purple, "bold" },
            separator = _SEPARATOR.right,
            separator_highlight = { _HEX_COLORS.purple, _HEX_COLORS.bar.middle },
        },
    },
}

section.short_line_right = {
    {
        BufferIcon = {
            provider = "BufferIcon",
            highlight = { _HEX_COLORS.black, _HEX_COLORS.purple, "bold" },
            separator = _SEPARATOR.left,
            separator_highlight = { _HEX_COLORS.purple, _HEX_COLORS.bar.middle },
        },
    },
}
