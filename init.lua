minetest.register_node("weedstone:stone_with_weedstone", {
	description = "Stone with Weedstone Ore",
	tiles = {"default_stone.png^weedstone_mineral_weedstone.png"},
	groups = {cracky = 3},
	drop = "weedstone:neutral_off",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "weedstone:stone_with_weedstone",
	wherein        = "default:stone",
	clust_scarcity = 7 * 7 * 7,
	clust_num_ores = 10,
	clust_size     = 4,
	y_max          = 31000,
	y_min          = -31000,
})

minetest.register_craft({
	output = "weedstone:neutral_on",
	recipe = {{"weedstone:neutral_off"}},
})

minetest.register_craft({
	output = "weedstone:wire_off",
	recipe = {{"weedstone:neutral_on"}},
})

minetest.register_craft({
	output = "weedstone:wire_on",
	recipe = {{"weedstone:wire_off"}},
})

minetest.register_craft({
	output = "weedstone:torch_off",
	recipe = {{"weedstone:wire_on"}},
})

minetest.register_craft({
	output = "weedstone:torch_on",
	recipe = {{"weedstone:torch_off"}},
})

minetest.register_craft({
	output = "weedstone:neutral_off",
	recipe = {{"weedstone:torch_on"}},
})

minetest.register_node("weedstone:neutral_off", {
	description = "Weedstone NOP (off)",
	tiles = {"weedstone_neutral_off.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("weedstone:neutral_on", {
	description = "Weedstone NOP (on)",
	tiles = {"weedstone_neutral_on.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("weedstone:wire_off", {
	description = "Weedstone INQ (off)",
	tiles = {"weedstone_wire_off.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("weedstone:wire_on", {
	description = "Weedstone INQ (on)",
	tiles = {"weedstone_wire_on.png"},
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	--drop = "weedstone:wire_off",
})

minetest.register_node("weedstone:torch_off", {
	description = "Weedstone CMP (off)",
	tiles = {"weedstone_torch_off.png"},
	groups = {cracky = 3, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	--drop = "weedstone:torch_on",
})

minetest.register_node("weedstone:torch_on", {
	description = "Weedstone CMP (on)",
	tiles = {"weedstone_torch_on.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_abm({
	nodenames = {"weedstone:wire_off", "weedstone:wire_on"},
	interval = 1,
	chance = 1,
	action = function(pos)
		local n = 0
		if minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name == "weedstone:wire_on" or minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name == "weedstone:torch_on" then
			n = n + 1
		end
		if n % 2 == 0 then
			minetest.set_node(pos, {name="weedstone:wire_on"})
		else
			minetest.set_node(pos, {name="weedstone:wire_off"})
		end
	end
})

minetest.register_abm({
	nodenames = {"weedstone:torch_off", "weedstone:torch_on"},
	interval = 1,
	chance = 1,
	action = function(pos)
		local n = 0
		if minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name == "weedstone:torch_on" or minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name == "weedstone:wire_on" then
			n = n + 1
		end
		if n % 2 == 1 then
			minetest.set_node(pos, {name="weedstone:torch_on"})
		else
			minetest.set_node(pos, {name="weedstone:torch_off"})
		end
	end
})
