# Give them enough Xp to become master
data modify entity @s Xp set value 250
data modify entity @s VillagerData.level set value 5
# # Give them a dummy trade which can be used to level them up
# data modify entity @s Offers.Recipes insert 0 value {buy:{id:emerald,count:1},sell:{id:emerald,count:1},maxUses:99999}
tag @s remove villager_init

say Initing villager

# If they are a nitwit, immediately tag them as inited and we are done
execute if entity @s[nbt={VillagerData:{profession:"minecraft:nitwit"}}] run scoreboard players set _villager_profession var -1
execute if score _villager_profession var matches -1 run say inited Nitwit!
execute if score _villager_profession var matches -1 run return run tag @s add villager_inited

# If they don't have a profession, hold off on initing them
execute if entity @s[nbt={VillagerData:{profession:"minecraft:none"}}] run scoreboard players set _villager_profession var 0
execute if score _villager_profession var matches 0 run say No profession - waiting to init
execute if score _villager_profession var matches 0 run return 1


# Get the villager type as a score in case professions need to be customized based on type
execute if entity @s[nbt={VillagerData:{type:"minecraft:desert"}}] run scoreboard players set _villager_type var 0
execute if entity @s[nbt={VillagerData:{type:"minecraft:jungle"}}] run scoreboard players set _villager_type var 1
execute if entity @s[nbt={VillagerData:{type:"minecraft:plains"}}] run scoreboard players set _villager_type var 2
execute if entity @s[nbt={VillagerData:{type:"minecraft:savanna"}}] run scoreboard players set _villager_type var 3
execute if entity @s[nbt={VillagerData:{type:"minecraft:snow"}}] run scoreboard players set _villager_type var 4
execute if entity @s[nbt={VillagerData:{type:"minecraft:swamp"}}] run scoreboard players set _villager_type var 5
execute if entity @s[nbt={VillagerData:{type:"minecraft:taiga"}}] run scoreboard players set _villager_type var 6

# Remove all vanilla trades
data modify entity @s Offers.Recipes set value []

# Run the villager-type-specific trade initialization
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:armorer"}}] run function questcraft:villager_init_armorer
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:butcher"}}] run function questcraft:villager_init_butcher
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cartographer"}}] run function questcraft:villager_init_cartographer
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cleric"}}] run function questcraft:villager_init_cleric
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:farmer"}}] run function questcraft:villager_init_farmer
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fisherman"}}] run function questcraft:villager_init_fisherman
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fletcher"}}] run function questcraft:villager_init_fletcher
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:leatherworker"}}] run function questcraft:villager_init_leatherworker
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:librarian"}}] run function questcraft:villager_init_librarian
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:mason"}}] run function questcraft:villager_init_mason
# DONE
execute if entity @s[nbt={VillagerData:{profession:"minecraft:shepherd"}}] run function questcraft:villager_init_shepherd
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:toolsmith"}}] run function questcraft:villager_init_toolsmith
# 
execute if entity @s[nbt={VillagerData:{profession:"minecraft:weaponsmith"}}] run function questcraft:villager_init_weaponsmith

# TEMP add a dummy trade for any uninitialized villagers to prevent them from being effectively nitwits and not able to be re-initialized easily
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:emerald,count:1},maxUses:99999}


# For any DnT tavern quest givers, make sure we add back their special trades
execute if entity @s[type=villager,tag=dnt_quest_trader] run function nova_structures:add_trade
execute if entity @s[type=villager,tag=dnt_quest_trader] run say DnT Trader inited
# TEMP change ^ to this!
# execute if entity @s[type=villager,tag=!trader,tag=dnt_quest_trader] run say DnT Trader inited

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