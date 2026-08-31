require("term-cwd"):setup()

require("git"):setup({
	order = 1500,
})

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Lualine-style header and status bars using the Gruvbox Dark palette.
require("yatline"):setup({
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	padding = { inner = 1, outer = 1 },

	style_a = {
		fg = "#282828",
		bg = "#83A598",
		bg_mode = {
			normal = "#83A598",
			select = "#D3869B",
			un_set = "#FB4934",
		},
	},
	style_b = { fg = "#EBDBB2", bg = "#3C3836" },
	style_c = { fg = "#EBDBB2", bg = "#282828" },

	permissions_t_fg = "#B8BB26",
	permissions_r_fg = "#FABD2F",
	permissions_w_fg = "#FB4934",
	permissions_x_fg = "#83A598",
	permissions_s_fg = "#D3869B",

	selected = { icon = "󰻭", fg = "#FABD2F" },
	copied = { icon = "", fg = "#B8BB26" },
	cut = { icon = "", fg = "#FB4934" },
	files = { icon = "", fg = "#83A598" },
	filtereds = { icon = "", fg = "#D3869B" },
	total = { icon = "󰮍", fg = "#FABD2F" },
	success = { icon = "", fg = "#B8BB26" },
	failed = { icon = "", fg = "#FB4934" },

	tab_width = 20,
	show_background = true,
	display_header_line = true,
	display_status_line = true,

	header_line = {
		left = {
			section_a = { { type = "line", name = "tabs" } },
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = { { type = "string", name = "date", params = { "%A, %d %B %Y" } } },
			section_b = { { type = "string", name = "date", params = { "%X" } } },
			section_c = {},
		},
	},

	status_line = {
		left = {
			section_a = { { type = "string", name = "tab_mode" } },
			section_b = { { type = "string", name = "hovered_size" } },
			section_c = {
				{ type = "string", name = "hovered_path" },
				{ type = "coloreds", name = "count" },
			},
		},
		right = {
			section_a = { { type = "string", name = "cursor_position" } },
			section_b = { { type = "string", name = "cursor_percentage" } },
			section_c = { { type = "coloreds", name = "permissions" } },
		},
	},
})
