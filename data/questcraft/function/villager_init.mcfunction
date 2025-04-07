# If the player is not in a POI, return early and don't mark the villager as inited yet.
# We want to ensure that the correct POI information is used when initing
execute if score _currentPoiType var matches 0 run return fail

# tell @a[tag=admin] Initing villager

# For kingdoms, determine the right variant for the biome since they always spawn as plains
execute if score _currentPoiType var matches 2 at @n[type=marker,tag=poi_marker_kingdom] if biome ~ ~ ~ #questcraft:is_coniferous_forest run data modify entity @s VillagerData.type set value "minecraft:taiga"
execute if score _currentPoiType var matches 2 at @n[type=marker,tag=poi_marker_kingdom] if biome ~ ~ ~ #questcraft:is_frozen run data modify entity @s VillagerData.type set value "minecraft:snow"

# If they are a nitwit, immediately tag them as inited and we are done
execute if entity @s[nbt={VillagerData:{profession:"minecraft:nitwit"}}] run scoreboard players set _villager_profession var -1
execute if score _villager_profession var matches -1 run tell @a[tag=admin] Inited Nitwit!
# For any nitwits that have trades, name them simply as "Traders", and do basic init steps
execute if score _villager_profession var matches -1 if data entity @s Offers.Recipes run data modify entity @s CustomName set value '{"text":"💰 Trader"}'
execute if score _villager_profession var matches -1 if data entity @s Offers.Recipes run data modify entity @s Xp set value 250
execute if score _villager_profession var matches -1 if data entity @s Offers.Recipes run data modify entity @s VillagerData.level set value 5
execute if score _villager_profession var matches -1 run tag @s add villager_inited
execute if score _villager_profession var matches -1 run return run scoreboard players reset _villager_profession var


# If they don't have a profession, hold off on initing them. We will finish later when a player trades with them
execute if entity @s[nbt={VillagerData:{profession:"minecraft:none"}}] run scoreboard players set _villager_profession var 0
execute if score _villager_profession var matches 0 run tell @a[tag=admin] No profession - waiting to init
# Give them a custom name so that players know to exit and re-enter
execute if score _villager_profession var matches 0 run data modify entity @s CustomName set value '{"color":"red","text":"Not ready, try later"}'
execute if score _villager_profession var matches 0 run tag @s add villager_inited
execute if score _villager_profession var matches 0 run tag @s add villager_inited_incomplete
execute if score _villager_profession var matches 0 run return run scoreboard players reset _villager_profession var

# If their initialization was incomplete, but is now possible, clear the tag tracking this
tag @s[tag=villager_inited_incomplete] remove villager_inited_incomplete

# Remove all vanilla trades
data modify entity @s Offers.Recipes set value []

# Give them enough Xp to become master and make them master, so the XP bar isn't there to be distracting
data modify entity @s Xp set value 250
data modify entity @s VillagerData.level set value 5


# Get the villager type as a score so trades can be customized based on type
execute if entity @s[nbt={VillagerData:{type:"minecraft:desert"}}] run scoreboard players set _villager_type var 0
execute if entity @s[nbt={VillagerData:{type:"minecraft:jungle"}}] run scoreboard players set _villager_type var 1
execute if entity @s[nbt={VillagerData:{type:"minecraft:plains"}}] run scoreboard players set _villager_type var 2
execute if entity @s[nbt={VillagerData:{type:"minecraft:savanna"}}] run scoreboard players set _villager_type var 3
execute if entity @s[nbt={VillagerData:{type:"minecraft:snow"}}] run scoreboard players set _villager_type var 4
execute if entity @s[nbt={VillagerData:{type:"minecraft:swamp"}}] run scoreboard players set _villager_type var 5
execute if entity @s[nbt={VillagerData:{type:"minecraft:taiga"}}] run scoreboard players set _villager_type var 6

# Run the villager-type-specific trade initialization
execute if entity @s[nbt={VillagerData:{profession:"minecraft:armorer"}}] run function questcraft:villager_init_armorer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:butcher"}}] run function questcraft:villager_init_butcher
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cartographer"}}] run function questcraft:villager_init_cartographer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cleric"}}] run function questcraft:villager_init_cleric
execute if entity @s[nbt={VillagerData:{profession:"minecraft:farmer"}}] run function questcraft:villager_init_farmer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fisherman"}}] run function questcraft:villager_init_fisherman
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fletcher"}}] run function questcraft:villager_init_fletcher
execute if entity @s[nbt={VillagerData:{profession:"minecraft:leatherworker"}}] run function questcraft:villager_init_leatherworker
execute if entity @s[nbt={VillagerData:{profession:"minecraft:librarian"}}] run function questcraft:villager_init_librarian
execute if entity @s[nbt={VillagerData:{profession:"minecraft:mason"}}] run function questcraft:villager_init_mason
execute if entity @s[nbt={VillagerData:{profession:"minecraft:shepherd"}}] run function questcraft:villager_init_shepherd
execute if entity @s[nbt={VillagerData:{profession:"minecraft:toolsmith"}}] run function questcraft:villager_init_toolsmith
execute if entity @s[nbt={VillagerData:{profession:"minecraft:weaponsmith"}}] run function questcraft:villager_init_weaponsmith

tellraw @a[tag=admin] [{"italic":true,"color":"gray","text":"Inited "},{"nbt":"VillagerData.type","entity":"@s","source":"entity"},{"text":" "},{"nbt":"VillagerData.profession","entity":"@s","source":"entity"}]

# Mark the villager as initialized
tag @s add villager_inited

# Mark that any villager was initialized in this run
scoreboard players set _any_villager_inited var 1

scoreboard players reset _villager_type var
