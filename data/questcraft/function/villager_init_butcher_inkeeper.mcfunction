
# Determine the local or house stew and save it to the poi marker
execute run scoreboard players set _random_val var 0
# Don't re-do it if we already did
execute unless entity @n[type=marker,tag=poi_marker,distance=..160,nbt={data:{localStew:{}}}] store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:5}
$execute if score _random_val var matches 1 run data modify entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew set value {buy:{id:emerald,count:10},sell:{id:suspicious_stew,count:1,components:{suspicious_stew_effects:[{id:saturation, duration:7}],rarity:uncommon,custom_name:'{"text":"$(poiName) Stew"}',lore:['{"text":"A local delicacy in $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']}},maxUses:10}
$execute if score _random_val var matches 2 run data modify entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew set value {buy:{id:emerald,count:10},sell:{id:suspicious_stew,count:1,components:{suspicious_stew_effects:[{id:night_vision, duration:6000}],rarity:uncommon,custom_name:'{"text":"$(poiName) Stew"}',lore:['{"text":"A local delicacy in $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']}},maxUses:10}
$execute if score _random_val var matches 3 run data modify entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew set value {buy:{id:emerald,count:10},sell:{id:suspicious_stew,count:1,components:{suspicious_stew_effects:[{id:fire_resistance, duration:6000}],rarity:uncommon,custom_name:'{"text":"$(poiName) Stew"}',lore:['{"text":"A local delicacy in $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']}},maxUses:10}
$execute if score _random_val var matches 4 run data modify entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew set value {buy:{id:emerald,count:10},sell:{id:suspicious_stew,count:1,components:{suspicious_stew_effects:[{id:regeneration, duration:6000}],rarity:uncommon,custom_name:'{"text":"$(poiName) Stew"}',lore:['{"text":"A local delicacy in $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']}},maxUses:10}
$execute if score _random_val var matches 5 run data modify entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew set value {buy:{id:emerald,count:10},sell:{id:suspicious_stew,count:1,components:{suspicious_stew_effects:[{id:jump_boost, duration:6000}],rarity:uncommon,custom_name:'{"text":"$(poiName) Stew"}',lore:['{"text":"A local delicacy in $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']}},maxUses:10}

# Add the local or house recipe
data modify entity @s Offers.Recipes append from entity @n[type=marker,tag=poi_marker,distance=..160] data.localStew

# For tavern inkeepers, rename it to "House Stew"
$execute if score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes[-1].sell.components."minecraft:custom_name" set value '{"text":"$(poiName) Stew"}'
$execute if score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes[-1].sell.components."minecraft:lore" set value ['{"text":"The house special of the $(poiName)."}','{"text":"Try it to see what special effects it might have!"}']

# Add a trade to return bowls
data modify entity @s Offers.Recipes append value {buy:{id:bowl,count:1},sell:{id:emerald,count:1},maxUses:10}


# Biome-specific trades

# desert
execute if score _villager_type var matches 0 if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:melon_slice,count:3},maxUses:99999}
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:cooked_rabbit,count:1},maxUses:99999}

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:melon_slice,count:3},maxUses:99999}
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cookie,count:2},maxUses:99999}

# plains
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:cake,count:1},maxUses:99999}
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:pumpkin_pie,count:1},maxUses:99999}

# savanna
# Nothing special

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:cooked_rabbit,count:1},maxUses:99999}


# swamp
# Nothing special

# taiga
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:pumpkin_pie,count:1},maxUses:99999}
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:cooked_rabbit,count:1},maxUses:99999}


# Inkeepers will also sell beetroot stew, mushroom stew, bread, and honey and water bottles
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:beetroot_soup,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:mushroom_stew,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:bread,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:potion,count:1,components:{potion_contents:{potion:"water"}}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},buyB:{id:glass_bottle,count:2},sell:{id:potion,count:2,components:{potion_contents:{potion:"water"}}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},buyB:{id:glass_bottle,count:1},sell:{id:potion,count:1,components:{potion_contents:{potion:"water"}}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:honey_bottle,count:1},maxUses:99999}

# Innkeepers (non-kingdom) will also sell a random cooked meat, including fish.
# (kingdom ones will sell all cooked meat, which is done after this by the calling function)
execute run scoreboard players set _random_val var 0
execute unless score _currentPoiType var matches 2 unless score _villager_type var matches 0 store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:6}
# Fish aren't an option in deserts
execute unless score _currentPoiType var matches 2 if score _villager_type var matches 0 store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:4}
execute if score _random_val var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:cooked_porkchop,count:1},maxUses:99999}
execute if score _random_val var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:cooked_beef,count:1},maxUses:99999}
execute if score _random_val var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:cooked_mutton,count:1},maxUses:99999}
execute if score _random_val var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:cooked_chicken,count:1},maxUses:99999}
execute if score _random_val var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:cooked_salmon,count:1},maxUses:99999}
execute if score _random_val var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:cooked_cod,count:1},maxUses:99999}

# Rename actual Inkeepers and make their name visible
execute if score _currentPoiType var matches 4 run data modify entity @s CustomName set value '[{"text":"🍴 "},{"text":"Inkeeper"}]'
execute if score _currentPoiType var matches 4 run data modify entity @s CustomNameVisible set value true

scoreboard players reset _random_val var