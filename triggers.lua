newaction({
	trigger = "clean",
	description = "clean all intermediate files",
	execute = function()
		local dirsToDelete = {
			"bin",
			"build",
			".vs",
		}
		local filesToDelete = {
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
		
		for i, v in ipairs(dirsToDelete) do
			os.rmdir(v)
		end
		
		if false then
			if os.istarget("windows") then
				for i, v in ipairs(filesToDelete) do
					--os.remove(v)		-- This will only delete files in the current folder
					os.execute("del /F /Q /S " .. v)
				end
			else
				os.execute("find . -name .DS_Store -delete")
				for i, v in ipairs(filesToDelete) do
					os.execute("rm -rf " .. v)
				end
			end
		end
	end
})