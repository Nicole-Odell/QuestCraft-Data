# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"👗 "},{"translate":"entity.minecraft.villager.leatherworker"}]'
data modify entity @s CustomNameVisible set value true

# Leatherworkers in kingdoms will sell saddles
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:saddle,count:1},maxUses:99999}

# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bundle,count:1},maxUses:99999}
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:rabbit_hide,count:2},maxUses:99999}

# jungle
# Nothing special

# plains
# Nothing special

# savanna
# Nothing special

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bundle,count:1},maxUses:99999}
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:rabbit_hide,count:2},maxUses:99999}

# swamp
# Nothing special

# taiga 
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bundle,count:1},maxUses:99999}
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:rabbit_hide,count:2},maxUses:99999}

# Leatherworkers will always sell leather
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:leather,count:1},maxUses:99999}

# Leatherworkers will also always sell all types of leather armor and horse of a random color.
# They will also offer to dye existing leather armor to their color for a fee
execute store result storage questcraft:args dyed_color int 1 run function questcraft:get_random_in_range {randMin:0,randMax:16777215}
function questcraft:villager_init_leatherworker_dyed with storage questcraft:args
data remove storage questcraft:args dyed_color

# Leatherworkers will always buy saddles, and all leather types and armors
data modify entity @s Offers.Recipes append value {buy:{id:saddle,count:1},sell:{id:emerald,count:20},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather_horse_armor,count:1},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather_helmet,count:1},sell:{id:emerald,count:5},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather_chestplate,count:1},sell:{id:emerald,count:8},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather_leggings,count:1},sell:{id:emerald,count:7},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather_boots,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:leather,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:rabbit_hide,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:turtle_scute,count:1},sell:{id:emerald,count:4},maxUses:99999}