function apply_catppuccin_theme()
    vim.cmd [[colorscheme catppuccin]]

    require("rainbow-delimiters").enable()

    local highlight = {
        "CatppuccinRed",
        "CatppuccinYellow",
        "CatppuccinBlue",
        "CatppuccinOrange",
        "CatppuccinGreen",
        "CatppuccinViolet",
        "CatppuccinCyan",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "CatppuccinRed", { fg = "#f38ba8" })
        vim.api.nvim_set_hl(0, "CatppuccinYellow", { fg = "#f9e2af" })
        vim.api.nvim_set_hl(0, "CatppuccinBlue", { fg = "#89b4fa" })
        vim.api.nvim_set_hl(0, "CatppuccinOrange", { fg = "#fab387" })
        vim.api.nvim_set_hl(0, "CatppuccinGreen", { fg = "#a6e3a1" })
        vim.api.nvim_set_hl(0, "CatppuccinViolet", { fg = "#cba6f7" })
        vim.api.nvim_set_hl(0, "CatppuccinCyan", { fg = "#89dceb" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = true,      -- shows the '~' characters after the end of buffers
        term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = true,             -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15,          -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" },    -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            treesitter = true,
            harpoon = true,
            mason = true,
            rainbow_delimiters = true,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            telescope = {
                enabled = true,
                -- style = "nvchad"
            },
            indent_blankline = {
                enabled = true,
                scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                colored_indent_levels = true,
            },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        }
    }
}
