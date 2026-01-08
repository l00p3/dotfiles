return {
    "goolord/alpha-nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Custom ASCII art header
        dashboard.section.header.val = {
            "                     ____", "                 []|    (______",
            "                 []|__ / LUCA  \\",
            "                 ||   \\________/", "                 ||      ___",
            "                 ||     /_  )__",
            "      __|\\/)     ||   _/_ \\____)", ",----`     \\     ||  />=o)",
            "\\_____      \\    ||  \\]__\\", "      `--,_/U\\  B|\\__/===\\",
            "         |UUUU\\  ||_ _|_\\_ \\", "         |UUUUU\\_|[,`_|__|_)",
            "         |UUUUUU\\||__/_ __|",
            "         |UUUUUU/-(_\\_____/-------,",
            "         /UU/    |H\\__\\    HHHH|   \\\\",
            "         |UU/    |H\\  |HHHHHHH|    |\\\\\\",
            "         UU      |HH\\ \\HHHHHHH|    | \\\\",
            "         U       |<_\\,_\\HHHHHH|   /  \\\\",
            "          \\ (    |HHHHHHHHHHHHH   /  \\\\",
            "           \\ \\   |=============  /    \\\\\\",
            "              \\ |             | |",
            [[ __        __   _                            ]],
            [[ \ \      / /__| | ___ ___  _ __ ___   ___  ]],
            [[  \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ ]],
            [[   \ V  V /  __/ | (_| (_) | | | | | |  __/ ]],
            [[    \_/\_/ \___|_|\___\___/|_| |_| |_|\___| ]]
        }

        -- Custom buttons
        dashboard.section.buttons.val = {
            dashboard.button("e", "📜  New file",
                             ":ene <BAR> startinsert <CR>"),
            dashboard.button("q", "🏰  Quit NVIM", ":qa<CR>")
        }

        -- Dynamic footer with fortune (if available)
        local handle = io.popen("fortune 2>/dev/null")
        local fortune = handle and handle:read("*a") or ""
        if handle then handle:close() end
        dashboard.section.footer.val = fortune ~= "" and fortune or
                                           "Welcome to Neovim!"

        alpha.setup(dashboard.config)
    end
}
