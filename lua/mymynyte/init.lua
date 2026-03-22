local M = {}

function M.setup()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")
	vim.o.termguicolors = true
	vim.g.colors_name = "my-color-scheme"

	local colors = {
		eigen = "#16161d", -- eigengrau
		green = "#3ac971", -- medium sea green
		gray = "#888888",  -- arabic gray
		peri = "#c3bfff", -- periwinkle
		navy = "#7369ff", -- silent navy
		hot = "#f52a7e", -- ultra pink
		white = "#ffffff", -- full white
		gold = "#ffd500", -- gold
		sel = "#3c3c4f", -- selection, lighter eigengrau
	}

	local highlights = {

		-- literals, constants and numbers
		Normal = { bg = colors.eigen, fg = colors.white },
		String = { fg = colors.green }, -- any string between "" 
		["@string"] = { fg = colors.green }, -- ditto for .cpp
		Number = { fg = colors.hot }, -- any number
		["@number"] = { fg = colors.hot }, -- ^ ditto for .lua
		Character = { fg = colors.green }, -- any character between '' except special characters
		["@character"] = { fg = colors.green }, -- ^ ditto
		Constant = { fg = colors.hot, bold = true }, -- constant values like nullptr, true, false (.cpp)
		["@constant"] = { fg = colors.hot, italic = true, bold = true }, -- includes macro constants
		Boolean = { fg = colors.hot, italic = true }, -- make booleans specifically non-bold (.cpp)
		["@boolean"] = { fg = colors.hot, italic = true }, -- ^ ditto (.lua)

		-- functions
		Function = { fg = colors.peri, bold = true }, -- function calls (.cpp)
		["@function.builtin.lua"] = { fg = colors.peri, bold = true }, -- ^ ditto (.lua)

		-- attributes and variable names
		Identifier = { fg = colors.peri }, -- any variable name (.cpp)
		["@property"] = { fg = colors.white }, -- class attributes
		["@variable"] = { fg = colors.peri }, -- user made variables

		-- keywords
		PreProc = { fg = colors.navy, bold = true }, -- #include (.cpp)
		Statement = { fg = colors.navy, bold = true }, -- keywords that modify other constructs (.cpp)
		Type = { fg = colors.navy }, -- builtin types
		["@type"] = { fg = colors.peri }, -- user made types, classes and structs
		["@module"] = { fg = colors.peri }, -- modules and namespaces
		["@keyword"] = { fg = colors.navy }, -- any keyword not fitting into specific categories

		-- comments
		Comment = { fg = colors.gray, italic = true }, -- comments 

		-- miscellaneous
		Special = { fg = colors.hot }, -- special characters
		Operator = { fg = colors.peri }, -- e.g. + - * / %
		["@operator"] = { fg = colors.white }, -- ^ ditto
		["@constructor"] = { fg = colors.white }, -- v ditto
		["@constructor.lua"] = { fg = colors.white }, -- for some reason lua considers {} in this category (?)
		["@punctuation.delimiter"] = { fg = colors.white }, -- e.g ; . ,
		["@punctuation.bracket"] = { fg = colors.white }, -- e.g. () [] {}
		LineNr = { fg = colors.gray },
		CursorLineNr = { fg = colors.white, bold = true },
		Visual = { bg = colors.sel },
		ErrorMsg = { fg = colors.hot, bold = true },
		WarningMsg = { fg = colors.gold },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end

end

return M
