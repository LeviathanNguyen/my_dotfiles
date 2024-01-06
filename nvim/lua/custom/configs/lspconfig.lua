local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

require("lspconfig.ui.windows").default_options.border = "rounded"

local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

local path = util.path

local function get_python_path(workspace)
    -- Use activated pyenv
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use pyenv in workspace directory
    for _, pattern in ipairs({ "*", ".*" }) do
        local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
        if match ~= "" then
            return path.join(path.dirname(match), "bin", "python")
        end
    end

    -- Fallback to system Python
    return exepath "python3" or exepath "python" or "python"
end

-- if you just want default config for the servers then put them in a table
local servers = {
    "html",
    "cssls",
    "tsserver",
    "clangd",
    "emmet_ls",
    "tailwindcss",
    "jsonls",
    "yamlls",
    "dockerls",
    "lua_ls",
}

local lspInlays = { "tsserver" }

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

lspconfig.pyright.setup {
    before_init = function (_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
    end,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,
            }),
        },
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the "vim" global
                    globals = { "vim" },
                },
            },
        },
    }
end

for _, lsp in ipairs(lspInlays) do
    lspconfig[lsp].setup {
        on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = false,
            }),
        },
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    }
end
