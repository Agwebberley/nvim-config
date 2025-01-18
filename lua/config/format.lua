local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Add Prettier as a formatter
    null_ls.builtins.formatting.prettier.with({
      extra_args = { "--single-quote", "--jsx-single-quote" },
    }),

    -- Add Python formatter (optional)
    null_ls.builtins.formatting.black, -- Black for Python
    null_ls.builtins.diagnostics.flake8, -- Linter for Python
  },
  on_attach = function(client, bufnr)
    -- Add a keybinding for formatting
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.html", "*.css", "*.scss", "*.py" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

