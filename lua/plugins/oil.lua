return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
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
        }
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
