--local t = os.clock()

xdecor = {}
local modpath = minetest.get_modpath("xdecor")

dofile(modpath .. "/handlers/glasscut.lua")
dofile(modpath .. "/handlers/animations.lua")
dofile(modpath .. "/handlers/helpers.lua")
dofile(modpath .. "/handlers/nodeboxes.lua")
dofile(modpath .. "/handlers/registration.lua")

dofile(modpath .. "/src/nodes.lua")
dofile(modpath .. "/src/recipes.lua")

local subpart = {
	"chess",
	"cooking",
	"enchanting",
	"hive",
	"itemframe",
	"mailbox",
	"mechanisms",
	"rope",
	-- Workbench MUST be loaded last for the default 'cut node' registrations to work
	"workbench",
}

for _, name in ipairs(subpart) do
	local enable = minetest.settings:get_bool("enable_xdecor_" .. name)
	if enable or enable == nil then
		dofile(modpath .. "/src/" .. name .. ".lua")
	end
end

--print(string.format("[xdecor] loaded in %.2f ms", (os.clock()-t)*1000))
