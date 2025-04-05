# desert
execute if score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cactus,count:2},maxUses:99999}

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:melon_slice,count:3},maxUses:99999}
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:cookie,count:2},maxUses:99999}

# plains
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:cake,count:1},maxUses:99999}
execute if score _villager_type var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:pumpkin_pie,count:1},maxUses:99999}

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:sweet_berries,count:4},maxUses:99999}

# savanna
# Nothing special

# swamp
# Nothing special

# taiga 
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:pumpkin_pie,count:1},maxUses:99999}
execute if score _villager_type var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:sweet_berries,count:4},maxUses:99999}


# Farmers will always sell bread and basic crops, plus other crops based on the biome
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:apple,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:bread,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:3},sell:{id:beetroot_soup,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:beetroot,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:carrot,count:3},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:potato,count:3},maxUses:99999}

# Farmers will always buy any kind of crop or plant-based food, and bread
data modify entity @s Offers.Recipes append value {buy:{id:apple,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:bread,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:wheat,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:wheat_seeds,count:32},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:beetroot,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:beetroot_seeds,count:16},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:carrot,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:potato,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:melon_slice,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:pumpkin,count:1},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:cocoa_beans,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:sugar_cane,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:sweet_berries,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:glow_berries,count:4},sell:{id:emerald,count:1},maxUses:99999}
