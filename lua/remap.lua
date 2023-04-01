local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap


-- nnoremap("<leader>pv", "<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>pv", "<cmd>Ex<CR>")
inoremap("jk", "<ESC>")

nnoremap("<leader>gn", "<cmd>bn<CR>" )
nnoremap("<leader>gp", "<cmd>bp<CR>" )
nnoremap("<leader>gd", "<cmd>bd<CR>" )

local telescope_b = require("telescope.builtin")
nnoremap("ff", telescope_b.find_files)
nnoremap("fg", telescope_b.live_grep)
nnoremap("fb", telescope_b.buffers)
nnoremap("fh", telescope_b.help_tags)


-- bufferline
nnoremap("H", "<cmd>BufferLineCyclePrev<CR>")
nnoremap("L", "<cmd>BufferLineCycleNext<CR>")


-- DB
nnoremap("<leader>db", "<cmd>DBUIToggle<CR>")


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            -- nnoremap("K", vim.lsp.buf.hover)
            nnoremap('K', vim.lsp.buf.hover, { buffer = args.buf })
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
        end

        nnoremap("<leader>lr", vim.lsp.buf.rename)
        -- nnoremap("<leader>lc", vim.lsp.buf.code_action)
        nnoremap("<C-k>", vim.lsp.buf.signature_help)
        nnoremap("gD", vim.lsp.buf.declaration)
        nnoremap("gd", vim.lsp.buf.definition)
        nnoremap("gr", vim.lsp.buf.references)
        nnoremap("gi", vim.lsp.buf.implementation)
        nnoremap("[d",
            function() 
                vim.diagnostic.goto_prev(border_options)
            end
        )
        nnoremap("]d",
            function()
                vim.diagnostic.goto_next(border_options)
            end
        )
    end,
})

-- nnoremap("K", vim.lsp.buf.hover)
-- nnoremap("<C-k>", vim.lsp.buf.signature_help)
-- nnoremap("gD", vim.lsp.buf.declaration)
-- nnoremap("gd", vim.lsp.buf.definition)
-- nnoremap("gr", vim.lsp.buf.references)
-- nnoremap("gi", vim.lsp.buf.implementation)
-- nnoremap("[d",
--     function() 
--         vim.diagnostic.goto_prev(border_options)
--     end
-- )
-- nnoremap("]d",
--     function()
--         vim.diagnostic.goto_next(border_options)
--     end
-- )
