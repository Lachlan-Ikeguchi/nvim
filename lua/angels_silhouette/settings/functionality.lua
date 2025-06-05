---@diagnostic disable: unused-local
-- neovim
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.termguicolours = true

vim.opt.scrolloff = 10

vim.opt.clipboard = "unnamedplus"

local function is_whitespace(line)
    return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
    for _, entry in ipairs(tbl) do
        if not check(entry) then
            return false
        end
    end
    return true
end

-- Neoclip
require('neoclip').setup({
    history = 1000,
    enable_persistent_history = true,
    length_limit = 1048576,
    continuous_sync = true,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = function(data)
        return not all(data.event.regcontents, is_whitespace)
    end,
    preview = true,
    prompt = nil,
    default_register = '"',
    default_register_macros = 'q',
    enable_macro_history = true,
    content_spec_column = true,
    disable_keycodes_parsing = false,
    dedent_picker_display = false,
    initial_mode = 'insert',
    on_select = {
        move_to_front = true,
        close_telescope = true,
    },
    on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
    },
    on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
    },
    on_custom_action = {
        close_telescope = true,
    },
})

-- Comment
require('nvim_comment').setup {
    marker_padding = true,
    comment_empty = false,
    comment_empty_trim_whitespace = true,
    hook = nil
}

-- File system
require("oil").setup {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
    lsp_file_methods = {
        autosave_changes = true,
    },
    watch_for_changes = true,
    view_options = {
        show_hidden = true,
    },
    git = {
        add = function(path)
            return true
        end,
        mv = function(src_path, dest_path)
            return true
        end,
        rm = function(path)
            return true
        end,
    },
}
