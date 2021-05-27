local M = {}

function M.find_notes()
    require'telescope_builtin'.file_browser({
        prompt_title = "\\ Notes /",
        shorten_path = false,
        cwd = "~/Documents/notes",
        width = .25,

        layout_strategy = 'horizontal',
        layout_config = {
            preview_width = 0.65,
        }
    })
end

return M
