

local modpath = minetest.get_modpath("winter_is_coming")

local modname = "winter_is_coming"



minetest.register_abm({
	nodenames = { "default:snow" },
	interval = 1,
	chance = 5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.find_node_near(pos, 2, {"default:dirt_with_grass"})
		if n == nil then
			return
		end
		
		minetest.set_node(n, {name="default:dirt_with_snow"})
		
		n.y = n.y + 1
		local q = minetest.get_node(n)
		
		if q == nil then 
			return
		end
		
		if minetest.get_item_group(q.name, "flora") > 0 then 
			minetest.set_node(n, {name="default:dry_shrub"})
		end
		
	end,
})

minetest.register_abm({
	nodenames = { "default:dirt_with_snow" },
	interval = 1,
	chance = 10,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local n = minetest.find_node_near(pos, 1, {"default:dirt_with_snow"})
		if n ~= nil then
			n.y = n.y + 1
			local q = minetest.get_node(n)
			if q ~= nil and (q.name == "air" or q.name == "default:grass") then 
				minetest.set_node(n, {name="default:snow"})
			end
		end
	end,
})
