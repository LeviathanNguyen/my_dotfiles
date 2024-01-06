local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local notify = vim.notify

-- vim.notify = function(msg, ...)
--     if msg:match("warning: multiple different client offset_encodings") then
--         return
--     end
--
--     notify(msg, ...)
-- end

local sources = {

    -- webdev stuff
    b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua,

    -- Shell
    b.formatting.shfmt,
    b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    -- C, CPP
    b.diagnostics.cpplint,
    -- b.formatting.clang_format,

    -- Docker
    b.diagnostics.hadolint,

    -- PHP
    b.formatting.phpcsfixer,

    -- Python
    b.formatting.autopep8,
    b.diagnostics.mypy,
    b.diagnostics.ruff,
}

vim.diagnostic.config {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function (client, bufnr)
        vim.diagnostic.config {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = false,
        }
        if client.name == "tsserver" or client.name == "rust_analyzer" or client.name == "pyright" then
            client.resolved_capabilities.document_formatting = false
        end

        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
}

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
