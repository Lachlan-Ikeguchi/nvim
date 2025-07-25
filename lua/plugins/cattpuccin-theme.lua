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
