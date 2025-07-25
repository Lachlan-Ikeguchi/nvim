return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        { 'kkharji/sqlite.lua',           module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
        { 'ibhagwan/fzf-lua' },
    },
    config = function()
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
    end,
}
