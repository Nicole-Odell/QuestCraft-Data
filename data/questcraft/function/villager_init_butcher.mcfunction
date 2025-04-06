# Butchers in taverns function as inkeepers instead of butchers, and have different trades - They only sell cooked food as well as extra drinks


# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}

# jungle

# plains

# savanna
# Nothing special

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}


# swamp
# Nothing special

# taiga
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}


# Innkeepers have special sell trades that include coocked food and drinks
# This is also the case for butchers in kingdoms as they function like restaurant owners
execute if score _currentPoiType var matches 4 run function questcraft:villager_init_butcher_inkeeper
execute if score _currentPoiType var matches 2 run function questcraft:villager_init_butcher_inkeeper

# Non-inkeeper butchers will also sell feathers and all raw meat (except for rabbit)
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:feather,count:3},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:4},sell:{id:porkchop,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:4},sell:{id:beef,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:mutton,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:chicken,count:1},maxUses:99999}


# All butchers will always sell milk and eggs
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:milk_bucket,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:egg,count:1},maxUses:99999}

# Non-inkeeper Butchers will always buy all raw meat
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:porkchop,count:3},sell:{id:emerald,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:beef,count:3},sell:{id:emerald,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:mutton,count:2},sell:{id:emerald,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:chicken,count:2},sell:{id:emerald,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:rabbit,count:1},sell:{id:emerald,count:1},maxUses:99999}
execute unless score _currentPoiType var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:egg,count:1},sell:{id:emerald,count:1},maxUses:99999}