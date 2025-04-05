# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:2},maxUses:99999}

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:3},maxUses:99999}

# plains
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:cactus,count:1},maxUses:99999}

# savanna
execute if score _villager_type var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:1},maxUses:99999}

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:4},maxUses:99999}

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:4},maxUses:99999}

# taiga 
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:4},sell:{id:cactus,count:1},maxUses:99999}


# Profession will always sell
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:apple,count:1},maxUses:99999}

# Profession will always buy
data modify entity @s Offers.Recipes append value {buy:{id:apple,count:2},sell:{id:emerald,count:1},maxUses:99999}