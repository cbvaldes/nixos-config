local M = {}

M.setup = function(options)
	options.exclude = options.exclude or {}

	local function traverse(directory_path)
		local directory_handle = vim.uv.fs_opendir(directory_path, nil, 1000)
		if not directory_handle then
			vim.notify(
				'Could not open directory ' .. directory_path,
				vim.log.levels.ERROR
			)
			return
		end

		local entries = vim.uv.fs_readdir(directory_handle)
		if entries then
			for _, entry in ipairs(entries) do
				local full_path = directory_path .. '/' .. entry.name
				local canonical_path = string.sub(full_path, 3) -- without './'

				local should_be_excluded = false
				for _, excluded_path in ipairs(options.exclude) do
					if canonical_path == excluded_path then
						should_be_excluded = true
						break
					end
				end

				if not should_be_excluded then
					if entry.type == 'file' then
						vim.cmd.edit(canonical_path)
						if options.for_each_file then
							options.for_each_file()
						end
					elseif entry.type == 'directory' then
						traverse(full_path)
					end
				end
			end
		end

		vim.uv.fs_closedir(directory_handle)
	end

	traverse('.')
end

return M
