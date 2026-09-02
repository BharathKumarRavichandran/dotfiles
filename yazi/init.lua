require("term-cwd"):setup()

require("git"):setup({
	order = 1500,
})

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Lualine-style header and status bars using the Flexoki Dark palette.
require("yatline"):setup({
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	padding = { inner = 1, outer = 1 },

	style_a = {
		fg = "#100F0F",
		bg = "#3AA99F",
		bg_mode = {
			normal = "#3AA99F",
			select = "#CE5D97",
			un_set = "#D14D41",
		},
	},
	style_b = { fg = "#CECDC3", bg = "#282726" },
	style_c = { fg = "#CECDC3", bg = "#100F0F" },

	permissions_t_fg = "#879A39",
	permissions_r_fg = "#D0A215",
	permissions_w_fg = "#D14D41",
	permissions_x_fg = "#4385BE",
	permissions_s_fg = "#CE5D97",

	selected = { icon = "󰻭", fg = "#D0A215" },
	copied = { icon = "", fg = "#879A39" },
	cut = { icon = "", fg = "#D14D41" },
	files = { icon = "", fg = "#4385BE" },
	filtereds = { icon = "", fg = "#CE5D97" },
	total = { icon = "󰮍", fg = "#D0A215" },
	success = { icon = "", fg = "#879A39" },
	failed = { icon = "", fg = "#D14D41" },

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
