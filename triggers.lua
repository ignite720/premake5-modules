newaction({
	trigger = "clean",
	description = "clean all intermediate files",
	execute = function()
		local dirs_to_delete = {
			"bin",
			"build",
			".vs",
		}
		local files_to_delete = {
			"*.Makefile",
			"*.make",
			"*.db",
			"*.opendb",
			"*.vcxproj",
			"*.vcxproj.filters",
			"*.vcxproj.user",
			"*.sln",
			"*.xcodeproj",
			"*.xcworkspace",
		}
		files_to_delete = {}
		for i, v in ipairs(dirs_to_delete) do
			os.rmdir(v)
		end
		if os.istarget("windows") then
			for i, v in ipairs(files_to_delete) do
				--os.remove(v)	-- can only delete files in current directory
				os.execute("del /F /Q /S " .. v)
			end
		else
			os.execute("find . -name .DS_Store -delete")
			for i, v in ipairs(files_to_delete) do
				os.execute("rm -rf " .. v)
			end
		end
	end
})