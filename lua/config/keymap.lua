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

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>>", vim.cmd.terminal)

-- colour scheme
vim.keymap.set("n", "<leader>1", function()
    vim.cmd [[colorscheme catppuccin]]

    local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
end)

vim.keymap.set("n", "<leader>2", function()
    vim.cmd [[colorscheme matrix]]
    require("ibl").setup()
end)

