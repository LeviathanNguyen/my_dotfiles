local overrides = require "custom.configs.overrides"

-- @type NvPluginSpec[]
local plugins = {
    -- =================================================== --
    -- ================= DEFAULT PLUGINS ================= --
    -- =================================================== --
    {
        "goolord/alpha-nvim",
        lazy = false,
        config = function()
            require "custom.configs.alpha"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- Override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        enabled = false,
        opts = overrides.nvimtree,
    },

    {
        "nvim-telescope/telescope.nvim",
        opts = overrides.telescope,
    },

    {
        "NvChad/nvterm",
        opts = overrides.nvterm,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- cmp source for treesitter
            "ray-x/cmp-treesitter",

            -- nvim-cmp souroce for emoji
            "hrsh7th/cmp-emoji",

            -- nvim-cmp souroce for math calculation
            "hrsh7th/cmp-calc",

            -- nvim-cmp souroce for Neovim's cmdline
            "hrsh7th/cmp-cmdline",

            -- nvim-cmp for spellsuggest
            "f3fora/cmp-spell",
        },
        opts = overrides.cmp,
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- Uncomment if you want to re-enable which-key
    {
        "folke/which-key.nvim",
        enabled = true,
    },

    {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
    },

    "folke/neodev.nvim",

    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        opts = overrides.blankline,
    },

    -- =================================================== --
    -- ================== CUSTOM PLUGINS ================= --
    -- =================================================== --

    -- Escape from --INSERT-- mode without delay when typing
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- Autoclose tags in HTML, JSX only
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascriptreact" },
        -- after = "nvim-treesitter",
        config = function()
            local present, autotag = pcall(require, "nvim-ts-autotag")
            if present then
                autotag.setup()
            end
        end,
    },

    -- Get highlight group under cursor
    {
        "nvim-treesitter/playground",
        cmd = "TSCaptureUnderCursor",
        config = function()
            require("nvim-treesitter.configs").setup()
        end,
    },

    -- Highlight your indent line and the current chunk (context)
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require "custom.configs.hlchunk"
        end,
    },

    -- Rainbow parentheses using treesitter
    {
        "p00f/nvim-ts-rainbow",
        lazy = false,
    },

    -- A Lua plugin to write TypeScript
    "jose-elias-alvarez/typescript.nvim",

    -- Dim inactive windows
    {
        "sunjon/Shade.nvim",
        module = "shade",
        config = function()
            require "custom.configs.shade"
        end,
    },

    -- Notes & TODO stuff
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = function()
            require("custom.configs.neorg").setup()
            require("custom.configs.neorg").autocmd()
        end,
    },

    -- Preview definitions using floating windows
    {
        "rmagatti/goto-preview",
        config = function()
            require("goto-preview").setup {
                border = "rounded",
                dismiss_on_move = true,
                default_mappings = true,
            }
        end,
    },

    -- Emmet for vim
    "mattn/emmet-vim",

    -- Multiple cursors plugin for Neovim
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },

    -- Automatic time tracking and metrics
    {
        "wakatime/vim-wakatime",
        enabled = true,
        lazy = false,
    },

    -- A pretty diagnostics, references, telescope results, etc. list
    {
        "folke/trouble.nvim",
        lazy = false,
        config = function()
            require "custom.configs.trouble"
        end,
    },

    -- Highlight, list and search TODO comments
    {
        "folke/todo-comments.nvim",
        config = function()
            require "custom.configs.todo-comments"
        end,
    },

    -- Git wrapper
    "tpope/vim-fugitive",

    -- Git commit browser
    "junegunn/gv.vim",

    -- A fancy, configurable, notification manager for Neovim
    {
        "rcarriga/nvim-notify",
        config = function()
            require "custom.configs.notify"
        end,
    },

    -- UI Component Library for Neovim
    "MunifTanjim/nui.nvim",

    --UI for messages, cmdline and the popupmenu
    {
        "folke/noice.nvim",
        lazy = false,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "smjonas/inc-rename.nvim",
        },
        config = function()
            require "custom.configs.noice"
        end,
    },

    -- Neovim motion on speed
    {
        "smoka7/hop.nvim",
        lazy = false,
        version = "*",
        opts = {},
        config = function()
            require("hop").setup()
        end,
    },

    -- Dim inactive portions of the code
    "folke/twilight.nvim",

    -- Improve the default vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        lazy = false,
        config = function()
            require "custom.configs.dressing"
        end,
    },
    -- Remove all background colors to make Neovim transparent
    {
        "xiyaowong/nvim-transparent",
        config = function()
            require("transparent").setup {
                enable = true,
                extra_groups = {
                    "BufferLineTabClose",
                    "BufferlineBufferSelected",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                },
                exclude = {},
            }
        end,
    },

    -- Popupmenu for Code Actions
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    },

    -- Treesitter powered spellchecker
    {
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup {
                -- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
                enable = true,
                debug = false,
            }
        end,
    },

    -- A more adventurous wildmenu
    {
        "gelguy/wilder.nvim",
        lazy = false,
        dependencies = {
            -- Yet Another Remote Plugin Framework for Neovim
            "roxma/nvim-yarp",
        },
        -- rocks = "pcre2",
        config = function()
            require "custom.configs.wilder"
        end,
    },

    -- Develop inside docker containers
    "jamestthompson3/nvim-remote-containers",

    -- Partial implementation of LSP inlay hint
    {
        "lvimuser/lsp-inlayhints.nvim",
        lazy = false,
        config = function()
            require "custom.configs.lsp-inlayhints"
        end,
    },

    -- Neovim Statusline
    {
        "glepnir/galaxyline.nvim",
        lazy = false,
        branch = "main",
        config = function()
            require "custom.configs.galaxyline"
        end,
    },

    -- Neovim plugin for a code outline window
    {
        "stevearc/aerial.nvim",
        cmd = {
            "AerialToggle",
            "AerialPrev",
            "AerialNext",
            "AerialPrevUp",
            "AerialNextUp",
        },
        config = function()
            require "custom.configs.aerial"
        end,
    },

    -- Calling lazygit from within Neovim
    "kdheepak/lazygit.nvim",

    -- Automatically expand width of the current window
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require("windows").setup()
        end,
    },

    -- Visualize and resolve merge conflicts in Neovim
    {
        "akinsho/git-conflict.nvim",
        config = function()
            require("git-conflict").setup {
                default_mappings = true, -- disable buffer local mapping created by this plugin
                disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
                highlights = {
                    -- They must have background color, otherwise the default color will be used
                    incoming = "DiffText",
                    current = "DiffAdd",
                },
            }
        end,
    },

    -- Foldtext customization in Neovim
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup {
                sections = {
                    left = {
                        "content",
                    },
                    right = {
                        " ",
                        "number_of_folded_lines",
                        ": ",
                        "percentage",
                        " ",
                        function(config)
                            return config.fill_char:rep(3)
                        end,
                    },
                },
                fill_char = "•",

                remove_fold_markers = true,

                -- Keep the indentation of the content of the fold string.
                keep_indentation = true,

                -- Possible values:
                -- "delete" : Delete all comment signs from the fold string.
                -- "spaces" : Replace all comment signs with equal number of spaces.
                -- false    : Do nothing with comment signs.
                process_comment_signs = "spaces",

                -- Comment signs additional to the value of `&commentstring` option.
                comment_signs = {},

                -- List of patterns that will be removed from content foldtext section.
                stop_words = {
                    "@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
                },

                add_close_pattern = true, -- true, 'last_line' or false

                matchup_patterns = {
                    { "{", "}" },
                    { "%(", ")" }, -- % to escape lua pattern char
                    { "%[", "]" }, -- % to escape lua pattern char
                },

                ft_ignore = { "neorg" },
            }
        end,
    },

    -- LSP Signature Hint
    "ray-x/lsp_signature.nvim",

    -- Highlight argument's definitions and usages
    {
        "m-demare/hlargs.nvim",
        lazy = false,
        config = function()
            require("hlargs").setup()
        end,
    },

    -- Automatically highlighting other uses of the word under the cursor
    {
        "RRethy/vim-illuminate",
        lazy = false,
        config = function()
            require "custom.configs.illuminate"
        end,
    },

    -- Jump into the repositories (git, mercurial...)
    "cljoly/telescope-repo.nvim",

    -- Peek lines of the buffer
    {
        "nacro90/numb.nvim",
        lazy = false,
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
                centered_peeking = true, -- Peeked line will be centered relative to window
            }
        end,
    },

    -- Hlsearch Lens for Neovim
    {
        "kevinhwang91/nvim-hlslens",
        lazy = false,
        config = function()
            require("hlslens").setup()
        end,
    },

    -- An extension for telescope.nvim that allows you to switch between projects
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },

    -- File Browser extension for telescope.nvim
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
    },

    -- Neovim LSP plugin
    {
        "glepnir/lspsaga.nvim",
        -- lazy = false,
        event = "LspAttach",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
        config = function()
            require "custom.configs.lspsaga"
        end,
    },

    -- Cursorline number mode indicator
    {
        "melkster/modicator.nvim",
        event = "VimEnter",
        config = function()
            require "custom.configs.modicator"
        end,
    },

    -- Git Blame plugin for Neovim written in Lua
    "f-person/git-blame.nvim",

    -- Easily jump between Neovim's windows
    {
        "https://gitlab.com/yorickpeterse/nvim-window",
        lazy = false,
        config = function()
            require "custom.configs.nvim-windows"
        end,
    },

    -- An ultra fold in Neovim
    {
        "kevinhwang91/nvim-ufo",
        lazy = false,
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            require "custom.configs.ufo"
        end,
    },

    -- Syntax aware text-objects, select, move, swap, and peek support
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            require "custom.configs.textobjects"
        end,
    },

    -- Single tabpage interface for easily cycling through diffs
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },

    -- Nvim-treesitter plugin for setting the commentstring based on the cursor location in a file
    "JoosepAlviste/nvim-ts-context-commentstring",

    -- Show code context
    {
        "romgrk/nvim-treesitter-context",
        lazy = false,
        config = function()
            require("treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = {
                    -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        "class",
                        "function",
                        "method",
                    },
                },
            }
        end,
    },

    -- Strict, native code style formatting plugins for Neovim
    {
        "emileferreira/nvim-strict",
        config = function()
            require "custom.configs.strict"
        end,
    },

    -- TabNine plugin for Neovim
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require "custom.configs.tabnine"
        end,
    },

    -- Luajit FFI bindings to FZY
    "romgrk/fzy-lua-native",

    -- Terminal manager for Neovim
    {
        "voldikss/vim-floaterm",
        lazy = false,
    },

    -- Python indentation style
    "Vimjas/vim-python-pep8-indent",

    -- Create missing folders on save
    "jghauser/mkdir.nvim",

    -- Tabout plugin for Neovim
    {
        "abecodes/tabout.nvim",
        lazy = false,
        config = function()
            require "custom.configs.tabout"
        end,
    },

    -- LSP Plugin for working with Python virtual environments
    {
        "HallerPatrick/py_lsp.nvim",
        lazy = false,
        enabled = false,
        config = function()
            require("py_lsp").setup {
                auto_source = true,
                language_server = "pyright",
                source_strategies = { "default", "poetry", "conda", "system" },
                capabilities = nil,
                on_attach = nil,
                on_server_ready = nil,
                host_python = "/usr/bin/python",
                default_venv_name = ".pyenv",
                venvs = {},
            }
        end,
    },

    -- Gain the power to move lines and blocks
    {
        "fedepujol/move.nvim",
        lazy = false,
    },

    -- The yank/paste enhancement plugin for Neovim
    {
        "hrsh7th/nvim-pasta",
        lazy = false,
    },

    -- Debug Adapter Protocol client implementation for Neovim
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("core.utils").load_mappings "dap"
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local path = "C:/Users/ACER/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts/python.exe"
            require("dap-python").setup(path)
            require("core.utils").load_mappings "dap_python"
        end,
    },

    -- An UI for nvim-dap
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require "custom.configs.dap.ui"
        end,
    },

    -- Vim syntax highlighting for Kitty terminal
    {
        "fladson/vim-kitty",
        ft = "kitty",
    },

    -- Neovim plugin to manage the file system
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
            {
                "s1n7ax/nvim-window-picker",
                config = function()
                    require("window-picker").setup {
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the filetype is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                    }
                end,
            },
        },
        config = function()
            require "custom.configs.neotree"
        end,
    },
}

return plugins
