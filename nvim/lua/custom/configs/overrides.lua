local M = {}

local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "bash",
        "c",
        "cpp",
        "php",
        "phpdoc",
        "python",
        "typescript",
        "tsx",
        "java",
        "graphql",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "yaml",
        "regex",
    },

    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "svelte",
            "typescript",
            "typescriptreact",
            "vue",
            "xml",
        },
    },

    playground = {
        enable = true,
    },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },

    auto_install = true,

    context_commentstring = {
        enable = true,
    },
}

M.mason = {
    ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",

        -- Web Development
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "emmet-ls",
        "json-lsp",
        "graphql-language-service-cli",
        "tailwindcss-language-server",
        "eslint-lsp",
        "yaml-language-server",
        "yamllint",
        "prettierd",
        "yamlfmt",
        "intelephense",

        -- Shell
        "shfmt",
        "shellcheck",

        -- C/C++ Development
        "clangd",
        "clang-format",

        -- Python
        "flake8",
        "autopep8",
    },

    ui = {
        border = "rounded",
        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
    },

    view = {
        width = 30,
        side = "left",
        float = {
            enable = false,
            open_win_config = {
                relative = "cursor",
                border = "rounded",
                row = 1,
                col = 1,
            },
        },
    },

    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,

    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = " ",
            info = " ",
            warning = " ",
            error = " ",
        },
    },

    renderer = {
        highlight_opened_files = "all",
        highlight_git = true,
        group_empty = true,
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },

    tab = {
        sync = {
            open = true,
            close = true,
        },
    },
}

M.blankline = {
    indentLine_enabled = 1,
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvcheatsheet",
        "lsp_installer",
        "norg",
        "noice",
        "mason",
        "",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-- M.alpha = {
--     header = {
--         val = {
--             "                                                     ",
--             "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--             "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--             "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--             "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--             "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--             "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--             "                                                     ",
--         },
--     },
-- }

M.telescope = {
    defaults = {
        file_ignore_patterns = { "node_modules", ".docker", ".git" },
        mappings = {
            n = {
                ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
                ["<ESC>"] = actions.close,
                ["<C-u>"] = false,
                ["<M-p>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
    },
    extensions = {
        project = {
            base_dirs = {
                { "~/Workspaces/" },
            },
            order_by = "asc",
            hidden_files = true,
            sync_with_nvim_tree = true,
        },
    },
    extensions_list = { "themes", "terms", "notify", "aerial", "repo", "project", "noice" },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                },
            },
        },
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            mappings = {
                n = {
                    ["cd"] = function(prompt_bufnr)
                        local selection = require("telescope.actions.state").get_selected_entry()
                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                        require("telescope.actions").close(prompt_bufnr)
                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                        vim.cmd(string.format("silent lcd %s", dir))
                    end,
                },
            },
        },
    },
}

M.bufferline = {
    mode = "tabs",
    modified_icon = "●",
    highlights = {
        background = {
            guibg = "NONE",
        },
        fill = {
            guibg = "NONE",
        },
        close_button = {
            guibg = "NONE",
        },
        separator_visible = {
            guibg = "NONE",
        },
        tab_close = {
            guibg = "NONE",
        },
    },
}

M.nvterm = {
    terminals = {
        type_opts = {
            float = {
                border = "rounded",
                relative = "editor",
            },
        },
    },
    autochdir = true,
    behavior = {
        close_on_exit = true,
        auto_insert = true,
    },
    enable_new_mappings = true,
    toggle = {
        float = "<A-h>",
    },
}

M.cmp = {
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel",
        },

        documentation = {
            border = "rounded",
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(_, vim_item)
                local icons = require("nvchad_ui.icons").lspkind
                vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
                local item = _:get_completion_item()
                if item.detail then
                    vim_item.menu = item.detail
                end
                vim_item.menu = ({
                    nvim_lsp = "(LSP)",
                    emoji = "(Emoji)",
                    path = "(Path)",
                    calc = "(Calc)",
                    cmp_tabnine = "(Tabnine)",
                    vsnip = "(Snippet)",
                    luasnip = "(Snippet)",
                    buffer = "(Buffer)",
                    tmux = "(TMUX)",
                    copilot = "(Copilot)",
                    treesitter = "(TreeSitter)",
                })[_.source.name]
            end,
        },
    },
}

M.ui = {
    statusline = {
        separator_style = "default",
        overriden_modules = function()
            local X = {}

            X.modes = function()
                return ""
            end

            X.fileInfo = function()
                return ""
            end

            X.git = function()
                return ""
            end

            X.LSP_progress = function()
                return ""
            end

            X.LSP_Diagnostics = function()
                return ""
            end

            X.LSP_status = function()
                return ""
            end

            X.cwd = function()
                return ""
            end

            X.cursor_position = function()
                return ""
            end

            return X
        end,
    },

    tabufline = {
        enabled = false,
        lazyload = false,
        overriden_modules = function()
            local X = {}
            return X
        end,
    },
}

return M
