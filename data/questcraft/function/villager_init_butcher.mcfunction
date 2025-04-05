# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}

# jungle
# Nothing special

# plains
# Nothing special

# savanna
# Nothing special

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}

# swamp
# Nothing special

# taiga 
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:rabbit_stew,count:1},maxUses:99999}
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:rabbit,count:1},maxUses:99999}


# Butchers will always sell all raw meat (except for rabbit), milk, and eggs
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:porkchop,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:beef,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:mutton,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:chicken,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:milk_bucket,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:egg,count:1},maxUses:99999}

# Butchers will always buy all raw meat
data modify entity @s Offers.Recipes append value {buy:{id:porkchop,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:beef,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:mutton,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:chicken,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:rabbit,count:1},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:egg,count:1},sell:{id:emerald,count:1},maxUses:99999}