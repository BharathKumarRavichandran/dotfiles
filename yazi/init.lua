require("term-cwd"):setup()

require("git"):setup({
	order = 1500,
})

require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Lualine-style header and status bars using the Flexoki Dark palette.
local yatline = require("yatline")

yatline:setup({
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

-- Give each tab enough path context to distinguish common directory names.
Yatline.line.get.tabs = function(_, side)
	local tabs = {}
	local first, last, step = 1, #cx.tabs, 1

	if side == "right" then
		first, last, step = last, first, -1
	end

	for i = first, last, step do
		local item = cx.tabs[i]
		local cwd = item.current.cwd
		local current = cwd.name or item.name
		local parent = cwd.parent and cwd.parent.name
		local name = parent and string.format("%s/%s", parent, current) or current
		local text = ui.truncate(string.format("%d %s", i, name), { max = Yatline.config.tab_width })
		local style = i == cx.tabs.idx and Yatline.config.style_a or Yatline.config.style_c
		local bg = style.bg

		if i == cx.tabs.idx then
			bg = item.mode.is_select and style.bg_mode.select
				or item.mode.is_unset and style.bg_mode.un_set
				or style.bg_mode.normal
		end

		local outer = string.rep(" ", Yatline.config.padding.outer)
		local inner = string.rep(" ", Yatline.config.padding.inner)
		local padded = side == "right" and inner .. text .. outer or outer .. text .. inner
		local tab = ui.Span(padded):fg(style.fg):bg(bg)

		if i == cx.tabs.idx then
			if side ~= "right" and i > 1 then
				tabs[#tabs + 1] = ui.Span(Yatline.config.section_separator.close)
					:fg(Yatline.config.style_c.bg)
					:bg(bg)
			end

			local separator = ui.Span(
				side == "right" and Yatline.config.section_separator.open
					or Yatline.config.section_separator.close
		):fg(bg):bg(Yatline.config.style_c.bg)

			tabs[#tabs + 1] = side == "right" and ui.Line({ separator, tab:bold() })
				or ui.Line({ tab:bold(), separator })
		else
			tabs[#tabs + 1] = tab

			if side ~= "right" and i < #cx.tabs and i + 1 ~= cx.tabs.idx then
				tabs[#tabs + 1] = ui.Span(Yatline.config.part_separator.close)
					:fg(Yatline.config.style_c.fg)
					:bg(Yatline.config.style_c.bg)
			end
		end
	end

	return ui.Line(tabs)
end
