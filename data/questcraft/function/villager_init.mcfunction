# If the player is not in a POI, return early and don't mark the villager as inited yet.
# We want to ensure that the correct POI information is used when initing
execute if score _currentPoiType var matches 0 run return fail

# Give them enough Xp to become master and make them master, so the XP bar isn't there to be distracting
data modify entity @s Xp set value 250
data modify entity @s VillagerData.level set value 5

# TEMP
tag @s remove villager_init

tell @a[tag=admin] Initing villager

# For kingdoms, determine the right variant for the biome since they always spawn as plains
execute if score _currentPoiType var matches 2 at @n[type=marker,tag=poi_marker_kingdom] if biome ~ ~ ~ #questcraft:is_coniferous_forest run data modify entity @s VillagerData.type set value "minecraft:taiga"
execute if score _currentPoiType var matches 2 at @n[type=marker,tag=poi_marker_kingdom] if biome ~ ~ ~ #questcraft:is_frozen run data modify entity @s VillagerData.type set value "minecraft:snow"

# If they are a nitwit, immediately tag them as inited and we are done
execute if entity @s[nbt={VillagerData:{profession:"minecraft:nitwit"}}] run scoreboard players set _villager_profession var -1
execute if score _villager_profession var matches -1 run tell @a[tag=admin] Inited Nitwit!
execute if score _villager_profession var matches -1 run tag @s add villager_inited
execute if score _villager_profession var matches -1 run return run scoreboard players reset _villager_profession var

# Remove all vanilla trades
data modify entity @s Offers.Recipes set value []

# If they don't have a profession, hold off on initing them
execute if entity @s[nbt={VillagerData:{profession:"minecraft:none"}}] run scoreboard players set _villager_profession var 0
execute if score _villager_profession var matches 0 run tell @a[tag=admin] No profession - waiting to init
execute if score _villager_profession var matches 0 run return run scoreboard players reset _villager_profession var


# Get the villager type as a score so trades can be customized based on type
execute if entity @s[nbt={VillagerData:{type:"minecraft:desert"}}] run scoreboard players set _villager_type var 0
execute if entity @s[nbt={VillagerData:{type:"minecraft:jungle"}}] run scoreboard players set _villager_type var 1
execute if entity @s[nbt={VillagerData:{type:"minecraft:plains"}}] run scoreboard players set _villager_type var 2
execute if entity @s[nbt={VillagerData:{type:"minecraft:savanna"}}] run scoreboard players set _villager_type var 3
execute if entity @s[nbt={VillagerData:{type:"minecraft:snow"}}] run scoreboard players set _villager_type var 4
execute if entity @s[nbt={VillagerData:{type:"minecraft:swamp"}}] run scoreboard players set _villager_type var 5
execute if entity @s[nbt={VillagerData:{type:"minecraft:taiga"}}] run scoreboard players set _villager_type var 6

# Run the villager-type-specific trade initialization
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:armorer"}}] run function questcraft:villager_init_armorer
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:butcher"}}] run function questcraft:villager_init_butcher
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cartographer"}}] run function questcraft:villager_init_cartographer
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cleric"}}] run function questcraft:villager_init_cleric
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:farmer"}}] run function questcraft:villager_init_farmer
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fisherman"}}] run function questcraft:villager_init_fisherman
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fletcher"}}] run function questcraft:villager_init_fletcher
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:leatherworker"}}] run function questcraft:villager_init_leatherworker
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:librarian"}}] run function questcraft:villager_init_librarian
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:mason"}}] run function questcraft:villager_init_mason
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:shepherd"}}] run function questcraft:villager_init_shepherd
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:toolsmith"}}] run function questcraft:villager_init_toolsmith
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:weaponsmith"}}] run function questcraft:villager_init_weaponsmith

tellraw @a[tag=admin] [{"italic":true,"color":"gray","text":"Inited "},{"nbt":"VillagerData.type","entity":"@s","source":"entity"},{"text":" "},{"nbt":"VillagerData.profession","entity":"@s","source":"entity"}]

# TEMP add a dummy trade for any uninitialized villagers to prevent them from being effectively nitwits and not able to be re-initialized easily
# data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:emerald,count:1},maxUses:99999}


# For any DnT tavern quest givers, make sure we add back their special trades
execute if entity @s[type=villager,tag=dnt_quest_trader] run function nova_structures:add_trade
execute if entity @s[type=villager,tag=dnt_quest_trader] run data modify entity @s CustomName set value '{"text":"Concierge"}'
execute if entity @s[type=villager,tag=dnt_quest_trader] run data modify entity @s CustomNameVisible set value true
execute if entity @s[type=villager,tag=dnt_quest_trader] run tell @a[tag=admin] DnT Trader inited
# TEMP change ^ to this!
# execute if entity @s[type=villager,tag=!trader,tag=dnt_quest_trader] run tell @a[tag=admin] DnT Trader inited

# TEMP uncomment this
# Mark the villager as initialized
# tag @s add villager_inited

# Mark that any villager was initialized in this run
scoreboard players set _any_villager_inited var 1

scoreboard players reset _villager_type var


# desert
# execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:2},maxUses:99999}

# # jungle
# execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}

# # plains
# execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}

# # savanna
# execute if score _villager_type var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}

# # snow
# execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}

# # swamp
# execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}

# # taiga
# execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:wheat,count:3},maxUses:99999}