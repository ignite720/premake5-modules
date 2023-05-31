# premake5-modules
```lua
dofile("premake5-modules/defines.lua")
dofile("premake5-modules/triggers.lua")
dofile("premake5-modules/VSPropertySheets.lua")
project("foobar")
	kind("ConsoleApp")
	language("C")
	filter("system:windows")
		VSPropertySheets({
			"D:\\dev2\\foo.props",
			"D:\\dev2\\bar.props",
		})
```
