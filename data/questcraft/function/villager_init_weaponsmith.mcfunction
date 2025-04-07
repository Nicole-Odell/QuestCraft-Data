# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"🔪 "},{"translate":"entity.minecraft.villager.weaponsmith"}]'
data modify entity @s CustomNameVisible set value true

# No biome-specific trades

# Weaponsmiths in kingdoms will have a chance to sell a diamond sword
scoreboard players set _random_val var 0
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:20}
execute if score _random_val var matches 1..10 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:56},sell:{id:diamond_sword,count:1},maxUses:1}

# Weaponsmiths will always sell iron swords, and charcoal
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:iron_sword,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:charcoal,count:8},maxUses:99999}

# Weaponsmiths in kingdoms will always sell golden swords
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:golden_sword,count:1},maxUses:99999}

# Weaponsmiths will always buy all types of swords, plus tridents
data modify entity @s Offers.Recipes append value {buy:{id:iron_sword,count:1},sell:{id:emerald,count:8},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:golden_sword,count:1},sell:{id:emerald,count:16},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:diamond_sword,count:1},sell:{id:emerald,count:28},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:netherite_sword,count:1},sell:{id:emerald,count:48},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:trident,count:1},sell:{id:emerald,count:20},maxUses:99999}


# Weaponsmiths will always buy all materials used for crafting weapons, plus coal, charcoal, and other mined materials
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