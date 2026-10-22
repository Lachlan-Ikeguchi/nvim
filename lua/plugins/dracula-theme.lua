function apply_dracula_theme()
    vim.cmd [[colorscheme dracula]]
end

return {
    "Mofiqul/dracula.nvim",
    config = function()
        local dracula = require("dracula")
        dracula.setup({
            show_end_of_buffer = true,
            transparent_bg = true,
            italic_comment = true,
        })
    end
}
