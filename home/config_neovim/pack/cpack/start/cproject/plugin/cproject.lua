-- Do not load the plugin if it was already loaded.

if vim.g.loaded_cproject then return end
vim.g.loaded_cproject = true

-- Register a keybind to load a project.

vim.keymap.set(
	'n', '<leader>lp',
	function()
		local project_file_path = '.project.lua'
		if not vim.fn.filereadable(project_file_path) then
			vim.notify('Could not find a project file', vim.log.levels.ERROR)
		else
			vim.cmd.source(project_file_path)
		end
	end
)
