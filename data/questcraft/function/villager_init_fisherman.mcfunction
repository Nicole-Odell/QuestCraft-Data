# Biome-specific trades

# desert
# Nothing special

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tropical_fish,count:1},maxUses:99999}

# plains
# Nothing special

# savanna
# Nothing special

# snow
# Nothing special

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tropical_fish,count:1},maxUses:99999}

# taiga 
# Nothing special


# Fishermen will always sell basic raw fish, unless in a desert
execute unless score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:5},sell:{id:salmon,count:1},maxUses:99999}
execute unless score _villager_type var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:2},sell:{id:cod,count:1},maxUses:99999}

# Fishermen will always buy all raw fish, as well as fish buckets at double their selling price
data modify entity @s Offers.Recipes append value {buy:{id:salmon,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:cod,count:1},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:tropical_fish,count:2},sell:{id:emerald,count:1},maxUses:99999}

# TODO: adjust these based on cost of bucket
data modify entity @s Offers.Recipes append value {buy:{id:salmon_bucket,count:1},sell:{id:emerald,count:10},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:cod_bucket,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:tropical_fish_bucket,count:1},sell:{id:emerald,count:2},maxUses:99999}