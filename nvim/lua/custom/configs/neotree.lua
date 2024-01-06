local present, neo_tree = pcall(require, "neo-tree")

if not present then
    return
end

neo_tree.setup {
    close_if_last_window = true,
    use_popups_for_input = true,
    popup_border_style = { "rounded" },
    enable_git_status = true,
    enable_diagnostics = true,
    statusline = false,
    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
    },
    source_selector = {
        winbar = true,
        statusline = false,
        separator = "",
        content_layout = "center",
        sources = {
            -- filesystem = "📁  DIR  ",
            -- buffers = "📒  BUF  ",
            -- git_status = "🚀 GIT  ",
            -- diagnostics = "🔥 LSP  ",
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
            { source = "diagnostics" },
        },
    },
    default_component_configs = {
        container = {
            enable_character_fade = true,
        },
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = false,
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            highlight = "NeoTreeFileIcon",
        },
        modified = {
            symbol = "",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                added = " ",
                deleted = " ",
                modified = " ",
                renamed = " ",
                untracked = " ",
                ignored = " ",
                unstaged = " ",
                staged = " ",
                conflict = " ",
            },
            align = "right",
        },
    },
    window = {
        position = "left",
        width = 40,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",
            ["a"] = {
                "add",
                config = {
                    show_path = "none",
                },
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        },
    },
    nesting_rules = {},
    filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
    },
    diagnostics = {
        auto_preview = true,
        auto_preview_config = {},
        auto_preview_event = "neo_tree_buffer_enter",
        bind_to_cwd = true,
        diag_sort_function = "severity",
        follow_behavior = {
            always_focus_file = true,
            expand_followed = true,
            collapse_others = true,
        },
        follow_current_file = true,
        group_dirs_and_files = true,
        group_empty_dirs = true,
        show_unloaded = true,
    },
}
