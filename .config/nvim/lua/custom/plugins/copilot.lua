return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        -- accept = "<Tab>",
                        accept = "<F8>",
                    },
                },
                panel = {
                    enabled = false,
                    -- keymap = {
                    --     accept = "<CR>",
                    --     open = "<C-CR>",
                    -- },
                    -- layout = {
                    --     position = "bottom"
                    -- }
                },
                filetypes = {
                    markdown = true,
                    help = true,
                },
            })
        end,
    }
}
