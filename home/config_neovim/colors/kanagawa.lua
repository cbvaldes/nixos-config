-- Based on https://github.com/rebelot/kanagawa.nvim

vim.cmd.highlight('clear')

if vim.fn.exists('syntax on') then
	vim.cmd.syntax('reset')
end

vim.opt.termguicolors = true
vim.g.colors_name = 'kanagawa'

local palette = {
	sumi_ink_0 = '#16161d',
	sumi_ink_1 = '#181820',
	sumi_ink_2 = '#1a1a22',
	sumi_ink_3 = '#1f1f28',
	sumi_ink_4 = '#2a2a37',
	sumi_ink_5 = '#363646',
	sumi_ink_6 = '#54546d',

	wave_blue_1 = '#223249',
	wave_blue_2 = '#2d4f67',

	winter_green  = '#2b3328',
	winter_yellow = '#49443c',
	winter_red    = '#43242b',
	winter_blue   = '#252535',
	autumn_green  = '#76946a',
	autumn_red    = '#c34043',
	autumn_yellow = '#dca561',

	samurai_red  = '#e82424',
	ronin_yellow = '#ff9e3b',
	wave_aqua_1  = '#6a9589',
	dragon_blue  = '#658594',

	old_white  = '#c8c093',
	fuji_white = '#dcd7ba',
	fuji_gray  = '#727169',

	oni_violet      = '#957fb8',
	oni_violet_2    = '#b8b4d0',
	crystal_blue    = '#7e9cd8',
	spring_violet_1 = '#938aa9',
	spring_violet_2 = '#9cabca',
	spring_blue     = '#7fb4ca',
	light_blue      = '#a3d4d5',
	wave_aqua_2     = '#7aa89f',

	spring_green  = '#98bb6c',
	boat_yellow_1 = '#938056',
	boat_yellow_2 = '#c0a36e',
	carp_yellow   = '#e6c384',

	sakura_pink   = '#d27e99',
	wave_red      = '#e46876',
	peach_red     = '#ff5d62',
	surimi_orange = '#ffa066',
	katana_gray   = '#717c7c',

	dragon_black_0 = '#0d0c0c',
	dragon_black_1 = '#12120f',
	dragon_black_2 = '#1d1c19',
	dragon_black_3 = '#181616',
	dragon_black_4 = '#282727',
	dragon_black_5 = '#393836',
	dragon_black_6 = '#625e5a',

	dragon_white    = '#c5c9c5',
	dragon_green    = '#87a987',
	dragon_green_2  = '#8a9a7b',
	dragon_pink     = '#a292a3',
	dragon_orange   = '#b6927b',
	dragon_orange_2 = '#b98d7b',
	dragon_gray     = '#a6a69c',
	dragon_gray_2   = '#9e9b93',
	dragon_gray_3   = '#7a8382',
	dragon_blue_2   = '#8ba4b0',
	dragon_violet   = '#8992a7',
	dragon_red      = '#c4746e',
	dragon_aqua     = '#8ea4a2',
	dragon_ash      = '#737c73',
	dragon_teal     = '#949fb5',
	dragon_yellow   = '#c4b28a',

	lotus_ink_1    = '#545464',
	lotus_ink_2    = '#43436c',
	lotus_gray     = '#dcd7ba',
	lotus_gray_2   = '#716e61',
	lotus_gray_3   = '#8a8980',
	lotus_white_0  = '#d5cea3',
	lotus_white_1  = '#dcd5ac',
	lotus_white_2  = '#e5ddb0',
	lotus_white_3  = '#f2ecbc',
	lotus_white_4  = '#e7dba0',
	lotus_white_5  = '#e4d794',
	lotus_violet_1 = '#a09cac',
	lotus_violet_2 = '#766b90',
	lotus_violet_3 = '#c9cbd1',
	lotus_violet_4 = '#624c83',
	lotus_blue_1   = '#c7d7e0',
	lotus_blue_2   = '#b5cbd2',
	lotus_blue_3   = '#9fb5c9',
	lotus_blue_4   = '#4d699b',
	lotus_blue_5   = '#5d57a3',
	lotus_green    = '#6f894e',
	lotus_green_2  = '#6e915f',
	lotus_green_3  = '#b7d0ae',
	lotus_pink     = '#b35b79',
	lotus_orange   = '#cc6d00',
	lotus_orange_2 = '#e98a00',
	lotus_yellow   = '#77713f',
	lotus_yellow_2 = '#836f4a',
	lotus_yellow_3 = '#de9800',
	lotus_yellow_4 = '#f9d791',
	lotus_red      = '#c84053',
	lotus_red_2    = '#d7474b',
	lotus_red_3    = '#e82424',
	lotus_red_4    = '#d9a594',
	lotus_aqua     = '#597b75',
	lotus_aqua_2   = '#5e857a',
	lotus_teal_1   = '#4e8ca2',
	lotus_teal_2   = '#6693bf',
	lotus_teal_3   = '#5a7785',
	lotus_cyan     = '#d7e3d8'
}

local themes = {
	wave = {
		ui = {
			fg         = palette.fuji_white,
			fg_dim     = palette.old_white,
			fg_reverse = palette.wave_blue_1,

			bg_dim    = palette.sumi_ink_1,
			bg_gutter = palette.sumi_ink_4,

			bg_m3 = palette.sumi_ink_0,
			bg_m2 = palette.sumi_ink_1,
			bg_m1 = palette.sumi_ink_2,
			bg    = palette.sumi_ink_3,
			bg_p1 = palette.sumi_ink_4,
			bg_p2 = palette.sumi_ink_5,

			special    = palette.spring_violet_1,
			nontext    = palette.sumi_ink_6,
			whitespace = palette.sumi_ink_6,

			bg_search = palette.wave_blue_2,
			bg_visual = palette.wave_blue_1,

			pmenu = {
				fg       = palette.fuji_white,
				fg_sel   = 'none',
				bg       = palette.wave_blue_1,
				bg_sel   = palette.wave_blue_2,
				bg_sbar  = palette.wave_blue_1,
				bg_thumb = palette.wave_blue_2
			},
			float = {
				fg        = palette.old_white,
				fg_border = palette.sumi_ink_0,
				bg        = palette.sumi_ink_6,
				bg_border = palette.sumi_ink_0
			}
		},
		syntax = {
			string      = palette.spring_green,
			variable    = 'none',
			number      = palette.sakura_pink,
			constant    = palette.surimi_orange,
			identifier  = palette.carp_yellow,
			parameter   = palette.oni_violet_1,
			func        = palette.crystal_blue,
			statement   = palette.oni_violet,
			keyword     = palette.oni_violet,
			operator    = palette.boat_yellow_2,
			preproc     = palette.wave_red,
			type        = palette.wave_aqua_2,
			regex       = palette.boat_yellow_2,
			deprecated  = palette.katana_gray,
			comment     = palette.fuji_gray,
			punctuation = palette.spring_violet_2,
			special1    = palette.spring_blue,
			special2    = palette.wave_red,
			special3    = palette.peach_red
		},
		vcs = {
			added   = palette.autumn_green,
			removed = palette.autumn_red,
			changed = palette.autumn_yellow,
		},
		diff = {
			add    = palette.winter_green,
			delete = palette.winter_red,
			change = palette.winter_blue,
			text   = palette.winter_yellow,
		},
		diagnostic = {
			ok      = palette.spring_green,
			error   = palette.samurai_red,
			warning = palette.ronin_yellow,
			info    = palette.dragon_blue,
			hint    = palette.wave_aqua_1,
		},
		term = {
			palette.sumi_ink_0,
			palette.autumn_red,
			palette.autumn_green,
			palette.boat_yellow_2,
			palette.crystal_blue,
			palette.oni_violet,
			palette.wave_aqua_1,
			palette.old_white,
			palette.fuji_gray,
			palette.samurai_red,
			palette.spring_green,
			palette.carp_yellow,
			palette.spring_blue,
			palette.spring_violet_1,
			palette.wave_aqua_2,
			palette.fuji_white,
			palette.surimi_orange,
			palette.peach_red
		}
	},
	lotus = {
		ui = {
			fg         = palette.lotus_ink_1,
			fg_dim     = palette.lotus_ink_2,
			fg_reverse = palette.lotus_gray,

			bg_dim    = palette.lotus_white_1,
			bg_gutter = palette.lotus_white_4,

			bg_m3 = palette.lotus_white_0,
			bg_m2 = palette.lotus_white_1,
			bg_m1 = palette.lotus_white_2,
			bg    = palette.lotus_white_3,
			bg_p1 = palette.lotus_white_4,
			bg_p2 = palette.lotus_white_5,

			nontext    = palette.lotus_violet_1,
			whitespace = palette.lotus_violet_1,
			special    = palette.lotus_violet_2,

			bg_visual = palette.lotus_violet_3,
			bg_search = palette.lotus_blue_2,

			pmenu = {
				fg       = palette.lotus_ink_2,
				fg_sel   = 'none',
				bg       = palette.lotus_blue_1,
				bg_sel   = palette.lotus_blue_3,
				bg_sbar  = palette.lotus_blue_1,
				bg_thumb = palette.lotus_blue_2
			},
			float = {
				fg        = palette.lotus_ink_2,
				fg_border = palette.lotus_gray_2,
				bg        = palette.lotus_white_0,
				bg_border = palette.lotus_white_0
			}
		},
		syntax = {
			string      = palette.lotus_green,
			variable    = 'none',
			number      = palette.lotus_pink,
			constant    = palette.lotus_orange,
			identifier  = palette.lotus_yellow,
			parameter   = palette.lotus_blue_5,
			func        = palette.lotus_blue_4,
			statement   = palette.lotus_violet_4,
			keyword     = palette.lotus_violet_4,
			operator    = palette.lotus_yellow_2,
			preproc     = palette.lotus_red,
			type        = palette.lotus_aqua,
			regex       = palette.lotus_yellow_2,
			deprecated  = palette.lotus_gray_3,
			comment     = palette.lotus_gray_3,
			punctuation = palette.lotus_teal_1,
			special1    = palette.lotus_teal_2,
			special2    = palette.lotus_red,
			special3    = palette.lotus_red
		},
		vcs = {
			added   = palette.lotus_green_2,
			removed = palette.lotus_red_2,
			changed = palette.lotus_yellow_3
		},
		diff = {
			add    = palette.lotus_green_3,
			delete = palette.lotus_red_4,
			change = palette.lotus_cyan,
			text   = palette.lotus_yellow_4
		},
		diagnostic = {
			error   = palette.lotus_red_3,
			ok      = palette.lotus_green,
			warning = palette.lotus_orange_2,
			info    = palette.lotus_teal_3,
			hint    = palette.lotus_aqua_2
		},
		term = {
			palette.sumi_ink_3,
			palette.lotus_red,
			palette.lotus_green,
			palette.lotus_yellow,
			palette.lotus_blue_4,
			palette.lotus_pink,
			palette.lotus_aqua,
			palette.lotus_ink_1,
			palette.lotus_gray_3 ,
			palette.lotus_red_2,
			palette.lotus_green_2,
			palette.lotus_yellow_2,
			palette.lotus_teal_2,
			palette.lotus_violet_4,
			palette.lotus_aqua_2,
			palette.lotus_ink_2,
			palette.lotus_orange_2,
			palette.lotus_red_3
		}
	}
}

local theme = nil

if vim.opt.background:get() == 'light' then
	theme = themes.lotus
elseif vim.opt.background:get() == 'dark' then
	theme = themes.wave
else
	vim.notify('Invalid value for vim.opt.background', vim.log.levels.ERROR)
end

local highlights = {
	editor = {
		ColorColumn = { bg = theme.ui.bg_p1 },
		Conceal = { fg = theme.ui.special, bold = true },
		CurSearch = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },
		Cursor = { fg = theme.ui.bg, bg = theme.ui.fg },
		lCursor = { link = 'Cursor' },
		CursorIM = { link = 'Cursor' },
		CursorColumn = { link = 'CursorLine' },
		CursorLine = { bg = theme.ui.bg_p2 },
		Directory = { fg = theme.syntax.func },
		DiffAdd = { bg = theme.diff.add },
		DiffChage = { bg = theme.diff.change },
		DiffDelete = { fg = theme.vcs.removed, bg = theme.diff.delete },
		DiffText = { bg = theme.diff.text },
		EndOfBuffer = { fg = theme.ui.bg },
		ErrorMsg = { fg = theme.diagnostic.error },
		WinSeparator = { fg = theme.ui.bg_m3, bg = theme.ui.fg },
		VertSplit = { link = 'WinSeparator' },
		Folded = { fg = theme.ui.special, bg = theme.ui.bg_p1 },
		FoldColumn = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
		SignColumn = { fg = theme.ui.special, bg = theme.ui.bg_gutter },
		IncSearch = { fg = theme.ui.fg_reverse, bg = theme.diagnostic.warning },
		Substitute = { fg = theme.ui.fg, bg = theme.vcs.removed },
		LineNr = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter },
		CursorLineNr = { fg = theme.diagnostic.warning, bg = theme.ui.bg_gutter, bold = true },
		MatchParen = { fg = theme.diagnostic.warning, bold = true },
		ModeMsg = { fg = theme.diagnostic.warning, bold = true },
		MsgArea = vim.opt.cmdheight:get() == 0 and { link = 'StatusLine' } or { fg = theme.ui.fg_dim },
		MsgSeparator = { bg = vim.opt.cmdheight:get() == 0 and theme.ui.bg or theme.ui.bg_m3 },
		MoreMsg = { fg = theme.diagnostic.info },
		NonText = { fg = theme.ui.nontext },
		Normal = { fg = theme.ui.fg, bg = theme.ui.bg },
		NormalFloat = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
		FloatBorder = { fg = theme.ui.float.fg_border, bg = theme.ui.float.bg_border },
		FloatTitle = { fg = theme.ui.special, bg = theme.ui.float.bg_border, bold = true },
		FloatFooter = { fg = theme.ui.nontext, bg = theme.ui.float.bg_border },
		NormalNC = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
		Pmenu = { fg = theme.ui.pmenu.fg, bg = theme.ui.pmenu.bg },
		PmenuSel = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel },
		PmenuKind = { fg = theme.ui.fg_dim, bg = theme.ui.pmenu.bg },
		PmenuKindSel = { fg = theme.ui.fg_dim, bg = theme.ui.pmenu.bg_sel },
		PmenuExtra = { fg = theme.ui.special, bg = theme.ui.pmenu.bg },
		PmenuExtraSel = { fg = theme.ui.special, bg = theme.ui.pmenu.bg_sel },
		PmenuSbar = { bg = theme.ui.pmenu.bg_sbar },
		PmenuThumb = { bg = theme.ui.pmenu.bg_thumb },
		Question = { link = 'MoreMsg' },
		QuickFixLine = { bg = theme.ui.bg_p1 },
		Search = { fg = theme.ui.fg, bg = theme.ui.bg_search },
		SpecialKey = { fg = theme.ui.special },
		SpellBad = { undercurl = true, sp = theme.diagnostic.error },
		SpellCap = { undercurl = true, sp = theme.diagnostic.warning },
		SpellLocal = { undercurl = true, sp = theme.diagnostic.warning },
		SpellRare = { undercurl = true, sp = theme.diagnostic.warning },
		StatusLine = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
		StatusLineNC = { fg = theme.ui.nontext, bg = theme.ui.bg_m3 },
		TabLine = { bg = theme.ui.bg_m3, fg = theme.ui.special },
		TabLineFill = { bg = theme.ui.bg },
		TabLineSel = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
		Title = { fg = theme.syntax.func, bold = true },
		Visual = { bg = theme.ui.bg_visual },
		VisualNOS = { link = 'Visual' },
		WarningMsg = { fg = theme.diagnostic.warning },
		Whitespace = { fg = theme.ui.whitespace },
		WildMenu = { link = 'Pmenu' },
		WinBar = { fg = theme.ui.fg_dim, bg = 'none' },
		WinBarNC = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },

		diffAdded = { fg = theme.vcs.added },
		diffRemoved = { fg = theme.vcs.removed },
		diffDeleted = { fg = theme.vcs.removed },
		diffChanged = { fg = theme.vcs.changed },
		diffOldFile = { fg = theme.vcs.removed },
		diffNewFile = { fg = theme.vcs.added }
	},
	syntax = {
		Comment = { fg = theme.syntax.comment },

		Constant = { fg = theme.syntax.constant },
		String = { fg = theme.syntax.string },
		Character = { link = 'String' },
		Number = { fg = theme.syntax.number },
		Boolean = { fg = theme.syntax.constant, bold = true },
		Float = { link = 'Number' },

		Identifier = { fg = theme.syntax.identifier },
		Function = { fg = theme.syntax.func },

		Statement = { fg = theme.syntax.statement },
		Conditional = { link = 'Statement' },
		Repeat = { link = 'Statement' },
		Label = { link = 'Statement' },
		Operator = { fg = theme.syntax.operator },
		Keyword = { fg = theme.syntax.keyword },
		Exception = { fg = theme.syntax.special2 },

		PreProc = { fg = theme.syntax.preproc },
		Include = { link = 'PreProc' },
		Define = { link = 'PreProc' },
		Macro = { link = 'PreProc' },
		PreCondit = { link = 'PreProc' },

		Type = { fg = theme.syntax.type },
		StorageClass = { link = 'Type' },
		Structure = { link = 'Type' },
		Typedef = { link = 'Type' },

		Special = { fg = theme.syntax.special1 },
		SpecialChar = { link = 'Special' },
		Tag = { link = 'Special' },
		Delimiter = { fg = theme.syntax.punctuation },
		SpecialComment = { link = 'Special' },
		Debug = { link = 'Special' },

		Underlined = { fg = theme.syntax.special1, underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		Ignore = { link = 'NonText' },

		Error = { fg = theme.diagnostic.error },

		Todo = { fg = theme.ui.fg_reverse, bg = theme.diagnostic.info, bold = true }
	},
	treesitter = {
		['@variable'] = { fg = theme.ui.fg },
		['@variable.builtin'] = { fg = theme.syntax.special2, italic = true },
		['@variable.parameter'] = { fg = theme.syntax.parameter },
		['@variable.member'] = { fg = theme.syntax.identifier },

		['@string.regexp'] = { fg = theme.syntax.regex },
		['@string.escape'] = { fg = theme.syntax.regex, bold = true },
		['@string.special.symbol'] = { fg = theme.syntax.identifier },
		['@string.special.url'] = { fg = theme.syntax.special1, underline = true },

		['@attribute'] = { link = 'Constant' },

		['@keyword.operator'] = { fg = theme.syntax.operator, bold = true },
		['@keyword.import'] = { link = 'PreProc' },
		['@keyword.exception'] = { link = 'Exception' }
	}
}

for _, entries in pairs(highlights) do
	for name, value in pairs(entries) do
		vim.api.nvim_set_hl(0, name, value)
	end
end
