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
vim.keymap.set('n', '<leader>fl', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>m', telescope_builtin.man_pages, {})
vim.keymap.set('n', '<leader>bf', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.git_branches, {})
vim.keymap.set('n', '<leader>fe', telescope_builtin.symbols, {})
vim.keymap.set('n', '<leader>wt', '<cmd>Telescope git_worktree<cr>')
vim.keymap.set("n", "<leader>wc", "<cmd>Telescope git_worktree create<cr>")

-- clipboard
vim.keymap.set('n', '<leader>cb', "<cmd>Telescope neoclip<cr>")

-- panels
vim.keymap.set("n", "<leader>v", vim.cmd.vnew)
vim.keymap.set("n", "<leader>h", vim.cmd.new)

-- save and close
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", "<cmd>Git fetch<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git pull --rebase<cr>")
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

-- multicursor
local multicursor = require("multicursor-nvim")
multicursor.setup()

vim.keymap.set({"n", "x"}, "M", multicursor.matchAllAddCursors)
vim.keymap.set("x", "I", multicursor.insertVisual)
vim.keymap.set("x", "A", multicursor.appendVisual)

-- search
vim.keymap.set("n", "<leader>/A", multicursor.searchAllAddCursors)
vim.keymap.set("n", "<leader>/n", function() multicursor.searchAddCursor(1) end)
vim.keymap.set("n", "<leader>/N", function() multicursor.searchAddCursor(-1) end)
vim.keymap.set("n", "<leader>/s", function() multicursor.searchSkipCursor(1) end)
vim.keymap.set("n", "<leader>/S", function() multicursor.searchSkipCursor(-1) end)

-- Add or skip cursor above/below the main cursor.
vim.keymap.set({ "n", "x" }, "<up>", function() multicursor.lineAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<down>", function() multicursor.lineAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<leader><up>", function() multicursor.lineSkipCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<leader><down>", function() multicursor.lineSkipCursor(1) end)

-- Add or skip adding a new cursor by matching word/selection
vim.keymap.set({ "n", "x" }, "<leader>n", function() multicursor.matchAddCursor(1) end)
vim.keymap.set({ "n", "x" }, "<leader>s", function() multicursor.matchSkipCursor(1) end)
vim.keymap.set({ "n", "x" }, "<leader>N", function() multicursor.matchAddCursor(-1) end)
vim.keymap.set({ "n", "x" }, "<leader>S", function() multicursor.matchSkipCursor(-1) end)

-- Add and remove cursors with control + left click.
vim.keymap.set("n", "<c-leftmouse>", multicursor.handleMouse)
vim.keymap.set("n", "<c-leftdrag>", multicursor.handleMouseDrag)
vim.keymap.set("n", "<c-leftrelease>", multicursor.handleMouseRelease)

-- Disable and enable cursors.
vim.keymap.set({ "n", "x" }, "<c-q>", multicursor.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
multicursor.addKeymapLayer(function(layerSet)
    -- Select a different cursor as the main one.
    layerSet({ "n", "x" }, "<left>", multicursor.prevCursor)
    layerSet({ "n", "x" }, "<right>", multicursor.nextCursor)

    -- Delete the main cursor.
    layerSet({ "n", "x" }, "<leader>x", multicursor.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not multicursor.cursorsEnabled() then
            multicursor.enableCursors()
        else
            multicursor.clearCursors()
        end
    end)
end)

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
