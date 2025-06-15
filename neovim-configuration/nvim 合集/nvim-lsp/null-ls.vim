lua << EOF
require("null-ls").setup({
    sources = {
			require("null-ls").builtins.diagnostics.eslint.with({
  				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
			}),
			require("null-ls").builtins.formatting.prettier.with({
  				filetypes = { "html", "json", "yaml", "markdown" },
			}),
			require("null-ls").builtins.formatting.stylelint.with({
  				filetypes = { "scss", "less", "css", "sass" },
			}),

--			require("null-ls").builtins.formatting.jsonlint.with({
--  				filetypes = { "json"},
--			}),

--			require("null-ls").builtins.formatting.pylint.with({
--  				filetypes = { "python"},
--			}),
    },
})

require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
EOF
