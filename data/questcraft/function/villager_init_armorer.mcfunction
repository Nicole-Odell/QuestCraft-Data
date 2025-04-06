# Biome-specific trades

# desert
# Nothing Special

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:46},sell:{id:turtle_helmet,count:1},maxUses:99999}

# plains
# Nothing Special

# savanna
execute if score _villager_type var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:30},sell:{id:wolf_armor,count:1},maxUses:99999}

# snow
# Nothing Special

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:46},sell:{id:turtle_helmet,count:1},maxUses:99999}

# taiga
# Nothing Special


# Netherite armor would be just game-breakingly expensive in this economy. So they don't sell it lol

# Armorers in kingdoms have a chance to sell diamond armor pieces
scoreboard players set _random_val var 0
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:3}
execute if score _random_val var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:64},sell:{id:diamond_helmet,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:8}
execute if score _random_val var matches 8 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:64},sell:{id:diamond_chestplate,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:5}
execute if score _random_val var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:64},sell:{id:diamond_leggings,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:3}
execute if score _random_val var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:32},sell:{id:diamond_boots,count:1},maxUses:99999}

# Armorers will always sell chanmail and iron armor
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:iron_helmet,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:52},sell:{id:iron_chestplate,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:iron_leggings,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:28},sell:{id:iron_boots,count:1},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:chainmail_helmet,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:chainmail_chestplate,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:chainmail_leggings,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:chainmail_boots,count:1},maxUses:99999}

# Armorers in kingdoms will sell horse armors
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:64},sell:{id:diamond_horse_armor,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:iron_horse_armor,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:8},sell:{id:golden_horse_armor,count:1},maxUses:99999}

# Armorers in kingdoms will always sell golden armor
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:golden_helmet,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:36},sell:{id:golden_chestplate,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},buyB:{id:emerald,count:20},sell:{id:golden_leggings,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:golden_boots,count:1},maxUses:99999}


# Armorers will always buy all types of armor, including specialty armors
data modify entity @s Offers.Recipes append value {buy:{id:diamond_horse_armor,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:golden_horse_armor,count:1},sell:{id:emerald,count:36},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_horse_armor,count:1},sell:{id:emerald,count:18},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:wolf_armor,count:1},sell:{id:emerald,count:14},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:turtle_helmet,count:1},sell:{id:emerald,count:22},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:netherite_helmet,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_chestplate,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_leggings,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_boots,count:1},sell:{id:emerald,count:64},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:diamond_helmet,count:1},sell:{id:emerald,count:60},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:diamond_chestplate,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:diamond_leggings,count:1},sell:{id:emerald,count:64},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:diamond_boots,count:1},sell:{id:emerald,count:48},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:golden_helmet,count:1},sell:{id:emerald,count:32},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:golden_chestplate,count:1},sell:{id:emerald,count:50},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:golden_leggings,count:1},sell:{id:emerald,count:42},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:golden_boots,count:1},sell:{id:emerald,count:24},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:iron_helmet,count:1},sell:{id:emerald,count:18},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_chestplate,count:1},sell:{id:emerald,count:26},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_leggings,count:1},sell:{id:emerald,count:24},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_boots,count:1},sell:{id:emerald,count:14},maxUses:99999}

data modify entity @s Offers.Recipes append value {buy:{id:chainmail_helmet,count:1},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:chainmail_chestplate,count:1},sell:{id:emerald,count:18},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:chainmail_leggings,count:1},sell:{id:emerald,count:16},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:chainmail_boots,count:1},sell:{id:emerald,count:10},maxUses:99999}


# Armorers will always buy all materials used for crafting armor, plus coal, charcoal, and other mined materials
data modify entity @s Offers.Recipes append value {buy:{id:turtle_scute,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:armadillo_scute,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_ingot,count:1},sell:{id:emerald,count:24},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_scrap,count:1},sell:{id:emerald,count:14},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:ancient_debris,count:1},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:diamond,count:1},sell:{id:emerald,count:12},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:gold_ingot,count:1},sell:{id:emerald,count:6},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:gold_nugget,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:raw_gold,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_ingot,count:1},sell:{id:emerald,count:3},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:iron_nugget,count:5},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:raw_iron,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:copper_ingot,count:2},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:raw_copper,count:3},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:coal,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:charcoal,count:8},sell:{id:emerald,count:1},maxUses:99999}

scoreboard players reset _random_val var