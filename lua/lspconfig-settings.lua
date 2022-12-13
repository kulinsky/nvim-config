-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    print('lsp attached:', client.name)

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = nil,
    max_height = nil,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    max_width = nil,
    max_height = nil,
})

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--         ["rust-analyzer"] = {}
--     }
-- }

local rt = require('rust-tools')

rt.setup({
    server = {
        -- on_attach = on_attach,
        flags = lsp_flags,

        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- Enable inlay hints auto update and set them for all the buffers
            rt.inlay_hints.enable()

            -- Hover actions
            vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, { buffer = bufnr })

            -- Code action groups
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

