require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = "Comment",
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    ["n"] = "Find notes",
    d = {
        name = "+Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>", "Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>", "Continue"},
        i = {"<cmd>DebugStepInto<cr>", "Step Into"},
        o = {"<cmd>DebugStepOver<cr>", "Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        s = {"<cmd>DebugStart<cr>", "Start"}
    },
    g = {
        name = "+Git",
        j = {"<cmd>lua require\"gitsigns\".next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require\"gitsigns\".prev_hunk()<cr>", "Prev Hunk"},
        p = {"<cmd>lua require\"gitsigns\".preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require\"gitsigns\".reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require\"gitsigns\".reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require\"gitsigns\".stage_hunk()<cr>", "Stage Hunk"},
        u = {"<cmd>lua require\"gitsigns\".undo_stage_hunk()<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
        S = {"<cmd>Telescope git_status<cr>", "Git Status"},
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Telescope lsp_code_actions<cr>", "Code Action"},
        A = {"<cmd>Telescope lsp_range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        -- l = {"<cmd>Telescope lsp_document_diagnostics<cr>", "LSP Finder"},
        -- L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Telescope lsp_definitions<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>lua vim.lsp.buf.rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    },

    s = {
        name = "+Search/Spell",
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        N = {"<cmd>Telescope find_files cwd=~/Documents/notes<cr>", "Find Note File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        n = {"<cmd>Telescope live_grep cwd=~/Documents/notes<cr>", "In notes"},
        s = {"1z=", "Accept First correction"},
        v = {"z=", "View corrections"},
        l = {"[s1z=`]", "Correct last error"}
    },
    S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}}
    -- Add terminal shortcuts
}

local wk = require("which-key")
wk.register(mappings, opts)
