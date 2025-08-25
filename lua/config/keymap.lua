-- update
vim.keymap.set("n", "<leader>sl", "<cmd>Lazy sync<cr>")

-- wordwrap
vim.keymap.set("n", "<leader>z", function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
    else
        vim.opt.wrap = true
    end
end)

-- tabs
vim.keymap.set("n", "<leader>p", vim.cmd.tabn)
vim.keymap.set("n", "<leader>o", vim.cmd.tabp)
vim.keymap.set("n", "<leader>nt", vim.cmd.tabnew)

-- resize
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

-- file manager
vim.keymap.set("n", "<leader><Tab>", "<cmd>Oil<cr>")

-- telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>m', telescope_builtin.man_pages, {})
vim.keymap.set('n', '<leader>bf', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.git_branches, {})
vim.keymap.set('n', '<leader>fs', telescope_builtin.git_stash, {})
vim.keymap.set('n', '<leader>fe', telescope_builtin.symbols, {})

-- panels
vim.keymap.set("n", "<leader>v", vim.cmd.vnew)
vim.keymap.set("n", "<leader>h", vim.cmd.new)

-- save and close
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", "<cmd>Git fetch<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git pull<cr>")
vim.keymap.set("n", "<leader>gP", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Gclog<cr>")

-- git conflict
--[[
co -- choose ours
ct -- choose theirs
cb -- choose both
c0 -- choose none
[x -- next conflict
]x -- previous conflict
--]]

-- comments
require('nvim_comment').setup {
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>cc",
}

-- harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>>", vim.cmd.terminal)

-- colour scheme
vim.keymap.set("n", "<leader>1", function()
    apply_catppuccin_theme()
end)


vim.keymap.set("n", "<leader>2", function()
    apply_dracula_theme()
end)

vim.keymap.set("n", "<leader>3", function()
    apply_matrix_theme()
end)
