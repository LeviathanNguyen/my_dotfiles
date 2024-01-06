local Menu = require "nui.menu"
local Input = require "nui.input"
local event = require("nui.utils.autocmd").event

local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function callBrowser(value, browser)
    local cmdBrowser = "Google Chrome"
    if browser == "Microsoft Edge" then
        cmdBrowser = "microsoft-edge-stable"
    end
    if browser == "Chromium" then
        cmdBrowser = "chromium"
    end
    if browser == "Google Chrome" then
        cmdBrowser = "google-chrome-stable"
    end
    if browser == "Firefox" then
        cmdBrowser = "firefox"
    end

    local command = string.format("silent! !%s 'https://google.com/search?q=%s'", cmdBrowser, value)
    vim.api.nvim_command(command)
end

local function BrowserInput(browser)
    local input = Input({
        position = "50%",
        size = {
            width = 25,
        },
        border = {
            style = "rounded",
            text = {
                top = "SEARCH",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        buf_options = {
            filetype = "nui",
        },
    }, {
        prompt = " ",
        default_value = "",
        on_close = function() end,
        on_submit = function(value)
            if trim(value) ~= "" then
                callBrowser(value, browser)
            end
        end,
    })

    input:mount()
    input:on(event.BufLeave, function()
        input:unmount()
    end)
end

local function MenuBrowser()
    local menu = Menu({
        position = "50%",
        size = {
            width = 20,
            height = 4,
        },
        border = {
            style = "rounded",
            text = {
                top = "BROWSER",
                top_align = "center",
            },
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        buf_options = {
            filetype = "nui",
        },
    }, {
        lines = {
            Menu.item "Google Chrome",
            Menu.item "Firefox",
            Menu.item "Microsoft Edge",
            Menu.item "Chromium",
        },
        max_width = 20,
        keymap = {
            focus_next = { "j", "<Down>", "<Tab>" },
            focus_prev = { "k", "<Up>", "<S-Tab>" },
            close = { "<Esc>", "<C-c>" },
            submit = { "<CR>", "<Space>" },
        },
        on_close = function() end,
        on_submit = function(item)
            BrowserInput(item.text)
        end,
    })

    menu:mount()
end

return {
    MenuBrowser = MenuBrowser,
}
