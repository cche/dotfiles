--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
O.auto_complete = true
O.colorscheme = 'onedark'
O.auto_close_tree = 0
O.wrap_lines = false
O.timeoutlen = 100
O.shell = "fish"

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = {"bash", "c", "cpp", "css", "dockerfile", "fish",
    "html", "javascript", "json", "julia", "lua", "python", "ql", "r", "rst",
    "ruby", "tsx", "typescript", "vue", "yaml"}
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true


O.clang.diagnostics.virtual_text = false
O.clang.diagnostics.signs = false
O.clang.diagnostics.underline = false

-- python
O.python.formatter = 'black'
O.python.linter = 'pylint'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true
O.python.analysis.type_checking = "off"
O.python.analysis.auto_search_paths = true
O.python.analysis.use_library_code_types = true

-- lua
O.lua.formatter = 'lua-format'
O.lua.autoformat = false

-- javascript
O.tsserver.formatter = 'prettier'
O.tsserver.linter = nil
O.tsserver.autoformat = true

-- json
O.json.autoformat = true

-- ruby
O.ruby.autoformat = true
