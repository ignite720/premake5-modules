require("vstudio")
local vs = premake.vstudio

premake.api.register({
	name = "VSPropertySheets",
	scope = "project",
	kind = "table",
	default = {},
})

local function DoVSPropertySheets(prj)
	if prj.VSPropertySheets then
		premake.push('<ImportGroup Label="PropertySheets">')
		for i, v in ipairs(prj.VSPropertySheets) do
			premake.w(string.format('<Import Project="%s" />', v))
		end
		premake.pop('</ImportGroup>')
	end
end

-- vs.vc2013 will fail!
premake.override(vs.vc2010.elements, "project", function(base, prj)
	local calls = base(prj)
	table.insertafter(calls, vs.vc2010.importExtensionSettings, DoVSPropertySheets)
	return calls
end)