# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"🧭 "},{"translate":"entity.minecraft.villager.cartographer"}]'
data modify entity @s CustomNameVisible set value true

# Set cartographers to the minimum level, so that players can trade with them to level up and get the vanilla trades
data modify entity @s VillagerData.level set value 1

# No biome-specific trades

# We could generate our own maps, but it takes ages to do so and lags the server
# data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:map,count:1},maxUses:99999}
# item replace entity @s weapon.mainhand with map 1
# item modify entity @s weapon.mainhand questcraft:make_exploration_map_fortress
# data modify entity @s Offers.Recipes[-1].sell merge from entity @s HandItems[0]

# Give them a nothing trade, so players don't need to meaningfully trade to level them up
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:emerald,count:1},maxUses:99999}

# Cartographers will always sell compasses and prospecting tools
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:compass,count:1},maxUses:99999}

# Cartographers will always buy compasses, maps, and paper
data modify entity @s Offers.Recipes append value {buy:{id:filled_map,count:1},sell:{id:emerald,count:14},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:map,count:1},sell:{id:emerald,count:10},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:compass,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:paper,count:3},sell:{id:emerald,count:1},maxUses:99999}


# For any DnT tavern quest givers, label them as regional experts
execute if entity @s[type=villager,tag=dnt_quest_trader] run data modify entity @s CustomName set value '{"text":"ℹ Regional Expert"}'
execute if entity @s[type=villager,tag=dnt_quest_trader] run data modify entity @s CustomNameVisible set value true
execute if entity @s[type=villager,tag=dnt_quest_trader] run tell @a[tag=admin] DnT Trader inited