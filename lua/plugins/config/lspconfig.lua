-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<S-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)



    -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
    -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
    -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
    vim.api.nvim_buf_set_keymap(bufnr, { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
    -- Set vim motion for <Space> + c + r to display references to the code under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
    -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", require("telescope.builtin").lsp_implementations,
        { desc = "[C]ode Goto [I]mplementations" })
    -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
    -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {"pyright", "clangd"}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
