--
-- General options
--

vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats  = 'unix,dos'

vim.opt.expandtab   = false
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4

vim.opt.backspace = 'indent,eol,start'
vim.opt.listchars = {
	tab   = '\\u2192\\u0020',
	trail = '\\u00b7',
	nbsp  = '\\u2423'
}

vim.opt.swapfile    = false
vim.opt.backup      = false
vim.opt.writebackup = false

vim.opt.belloff   = 'all'

--
-- Colorscheme
--

vim.opt.background = 'dark'

local status, _ = pcall(vim.cmd.colorscheme, 'kanagawa')
if not status then
	vim.notify('Failed to load colorscheme', vim.log.levels.WARN)
end

--
-- Keymaps
--

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- Enable/disable list mode
vim.keymap.set('n', '<leader>el', '<cmd>setlocal list<cr>')
vim.keymap.set('n', '<leader>dl', '<cmd>setlocal nolist<cr>')

-- Eanble/disable spell checking
vim.keymap.set('n', '<leader>esc', '<cmd>setlocal spell spelllang=en_us<cr>')
vim.keymap.set('n', '<leader>dsc', '<cmd>setlocal nospell<cr>')

-- Stop highlighting search results
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Toggle color scheme background (i.e., between 'dark' and 'light')
vim.keymap.set(
	'n', '<leader>tb',
	function()
		if vim.opt.background:get() == 'dark' then
			vim.opt.background = 'light'
		else
			vim.opt.background = 'dark'
		end
		local status, _ = pcall(vim.cmd.colorscheme, vim.g.colors_name)
		if not status then
			vim.notify('Failed to load colorscheme', vim.log.levels.WARN)
		end
	end
)

--
-- Status line
--

vim.opt.showmode = false

local ctrl_s = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local ctrl_v = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local status_line_modes = {
	['n']    = '   normal ',
	['v']    = '   visual ',
	['V']    = '   v-line ',
	[ctrl_v] = '  v-block ',
	['s']    = '   select ',
	['S']    = '   s-line ',
	[ctrl_s] = '  s-block ',
	['i']    = '   insert ',
	['R']    = '  replace ',
	['c']    = '  command ',
	['r']    = '   prompt ',
	['!']    = '    shell ',
	['t']    = ' terminal '
}

custom_status_line = function()
	return string.format(
		'%%#StatusLine1#%s%%#StatusLine2# %s %%#StatusLine1# %s',
		status_line_modes[vim.fn.mode()],
		'%f%m%r%=%y[%{&fenc}][%{&ff}]',
		'%l:%v '
	)
end

vim.go.statusline = '%!v:lua.custom_status_line()'

--
-- Autocmds
--

vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		desc     = 'Highlight line(s) when yanking text',
		group    = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
		callback = function() vim.hl.on_yank() end
	}
)
