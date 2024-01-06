local present, notify = pcall(require, "notify")

if not present then
    return
end

notify.setup {
    background_colour = "#192330",
}

-- notify("Welcome to my world", "success", { background_colour = "#000000", title = "System" })
