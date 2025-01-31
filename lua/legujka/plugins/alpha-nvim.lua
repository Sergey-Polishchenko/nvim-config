return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = {
[[⣿⡇⠀⠙⠻⠿⣿⣿⢿⣿⡿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣷⠑⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠀⠀⠀⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣧⠑⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣆⠀⠆⠀⠀⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⢿⣆⠀⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡄⠘⠀⢀⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈]],
[[⣿⣿⣿⣿⣆⠀⠀⠈⠒⠀⠀⢀⠀⠀⡠⠂⠀⠀⠀⠀⣠⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣷⠀⠀⢸⠿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠐⠀⡔⠁⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣶⣿⡆⠀⣾⣿⣿⣾⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⣰⣿⣿⡿⣿⠿⠿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⣿⣿⣿⣿⣿⣧⣸⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣯⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠙⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⢠⠆⠀⠀⠀⢠⠂⠀⠀⢀⣿⣿⢟⣽⣿⡿⣿⠛⠯⣛⣛⣋⣉⣉⣹⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⢡⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⢀⠆⢸⠀⠀⠠⠁⠀⠀⠀⣼⣿⣿⣿⡿⡳⣵⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣾⠀]],
[[⣿⣿⣯⡻⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠏⠀⢸⠀⡰⠁⠀⠀⠀⣼⣿⣿⢿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠐⡀⠀⠀⡏⠀]],
[[⣿⣿⣿⣿⣺⣭⣛⡃⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⡿⠿⣿⣛⣛⣛⠿⣿⣷⠀⠀⠀⠀⡌⠔⠁⠀⠀⠀⣰⣿⣿⣿⠟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢡⠀⢠⡇⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣯⡃⠀⠀⠀⠋⠀⠀⠀⠀⢰⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠇⢸⠁⠀]],
[[⣿⣿⣿⣿⣿⣿⣟⡿⠀⠀⠀⠀⠀⠀⡀⢿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⡞⠀⠀]],
[[⣿⣝⡛⠻⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠇⠈⢿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣕⣽⣿⣿⣿⣿⣟⣟⣿⣿⣿⣿⣿⣻⡇⠀⠀⠀⢸⠁⠀⠀]],
[[⣿⣿⣿⣳⣶⣤⣤⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠻⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣼⣿⣿⣿⢿⣟⣝⣵⣿⣿⣿⣿⣽⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⣷⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠙⢯⣻⣿⣿⡿⡵⣻⣿⣿⣻⣧⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣾⣿⣿⣿⣿⢿⣿⣻⣿⣧⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⡄⠀⠀⠀⠀⠈⢻⣿⣿⣿⣳⣽⠯⢿⣿⣷⡆⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣽⣿⣛⣛⣿⣷⣿⣿⣯⣾⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠢⠀⠀⠁⠀⠀⠀⠀⢀⣾⣿⣿⣿⡿⣿⣿⣿⠿⠿⢿⡀⠀⣘⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⣾⣿⣿⣿⣿⣿⣿⣻⠀⠀⠀⠀⠀⠀⠀]],
[[⡿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠣⡀⠘⠀⠀⠀⠀⣼⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⡟⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣯⣻⠿⣿⣿⠿⡟⠁⠀⠀⠀⠀⠐⢄⠂⠀⠀⢰⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣫⣾⣿⣿⣿⣿⢟⣵⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
[[⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⢸⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⢟⡿⣿⣿⣿⡿⣻⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⣸]],
[[⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⢿⣿⣿⣿⣿⣻⣿⣿⣻⣯⣷⣿⣿⣻⣿⣟⣿⣿⢟⣿⢞⣵⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⣠⣿]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣷⣿⡿⣿⢿⣿⣽⣻⣿⣛⣛⣻⣿⣿⣛⣷⣿⣿⡿⠟⣩⣶⢿⣷⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢠⣿⣿]],
[[⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡳⣯⣟⡿⢿⣿⣿⣿⣿⠿⣟⣫⣱⣵⡿⣿⣵⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⢠⣿⣿⣟]],
[[⣦⣤⣤⣤⣤⣤⣾⣿⣿⣿⣿⣿⣿⣟⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⢿⣿⣿⣾⣩⣱⣶⡿⣿⣛⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⣠⣿⣿⣿⣿]],
[[⣿⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣷⡿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣹⣿⣿⡟⠷⠙⠻⢟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⣰⣿⣟⣿⣿⣿]],
[[⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣾⣿⣽⢟⣿⢧⣾⣿⠏⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢀⣼⣿⣿⣿⣿⣿⣿]],
[[⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣫⣿⢻⣿⣿⣿⣿⣿⣿⣿⣯⣽⣿⢿⣿⣞⣿⣿⣿⣿⣿⣽⣿⢏⣿⣿⣾⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿]],
[[⣿⣿⣿⣿⣿⣿⣿⣷⣫⣾⣿⣿⣸⣿⡿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣝⡿⣙⠿⣿⣿⣿⣿⣿⣾⣯⣻⣿⣾⡀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢀⣼⡿⣿⣿⣿⣿⣿⣿⣿⣿]],
[[⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⡿⣫⣿⣿⣿⣿⢯⣿⣾⣿⣿⣝⢿⣿⣿⣿⣿⣿⣽⣧⠛⢿⣿⣿⣿⣿⣿⣷⣿⣷⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣟⣿⣿⣿⢏⣰⡿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿]],
        }
        dashboard.section.header.val = logo
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. "Find files", ":Telescope find_files <CR>"),
            dashboard.button("p", " " .. "Select project", ":Telescope project <CR>"),
            dashboard.button("m", " " .. "Mason", ":Mason <CR>"),
            dashboard.button("l", "󰚰 " .. "LazyUI", ":Lazy <CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "Function"
        dashboard.section.buttons.opts.hl = "Identifier"
        dashboard.section.footer.opts.hl = "Function"
        dashboard.opts.layout[1].val = 4
        return dashboard
    end,
    config = function(_, dashboard)
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
        require("alpha").setup(dashboard.opts)
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local v = vim.version()
                local dev = ""
                if v.prerelease == "dev" then
                    dev = "-dev+" .. v.build
                else
                    dev = ""
                end
                local version = v.major .. "." .. v.minor .. "." .. v.patch .. dev
                local stats = require("lazy").stats()
                local plugins_count = stats.loaded .. "/" .. stats.count
                local ms = math.floor(stats.startuptime + 0.5)
                local time = vim.fn.strftime("%H:%M:%S")
                local date = vim.fn.strftime("%d.%m.%Y")
                local line1 = " " .. plugins_count .. " plugins loaded in " .. ms .. "ms"
                local line2 = "󰃭 " .. date .. "  " .. time
                local line3 = " " .. version
                local line1_width = vim.fn.strdisplaywidth(line1)
                local line2Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line2)) / 2) .. line2
                local line3Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line3)) / 2) .. line3
                dashboard.section.footer.val = {
                    line1,
                    line2Padded,
                    line3Padded,
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
