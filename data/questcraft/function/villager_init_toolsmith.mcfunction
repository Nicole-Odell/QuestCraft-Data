# No biome-specific trades

# Toolsmiths in kingdoms will have a chance to sell one or more diamond tools
scoreboard players set _random_val var 0
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:2}
execute if score _random_val var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:56},sell:{id:diamond_axe,count:1},maxUses:1}
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:4}
execute if score _random_val var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:40},sell:{id:diamond_shovel,count:1},maxUses:1}
execute if score _currentPoiType var matches 2 run execute store result score _random_val var run function questcraft:get_random_in_range {randMin:1,randMax:8}
execute if score _random_val var matches 8 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:diamond_pickaxe,count:1},maxUses:1}

# Toolsmiths will always sell all types of iron tools
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:iron_axe,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:iron_shovel,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:iron_pickaxe,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bucket,count:1},maxUses:99999}

# Toolsmiths will always sell specialty tools
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:stone_sword,count:1,components:{custom_model_data:1,custom_name:'{"text":"Skinning and Prep Knife"}',lore:['{"text":"Used to prepare meat from animals for cooking"}']}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:flint_and_steel,count:1,components:{custom_name:'{"text":"Flint & Steel with Spark Powder"}',lore:['{"text":"Has limited uses before running out of spark powder"}']}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:6},sell:{id:shears,count:1,components:{lore:['{"text":"Has limited uses before becoming too dull to work"}']}},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:brush,count:1,components:{lore:['{"text":"Has limited uses before getting too frayed and damaged"}']}},maxUses:99999}

# Toolsmiths in kingdoms will always sell golden tools
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:golden_axe,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:golden_shovel,count:1},maxUses:99999}
execute if score _currentPoiType var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:40},sell:{id:golden_pickaxe,count:1},maxUses:99999}


# Toolsmiths will always buy all materials used for crafting tools, plus coal, charcoal, and other mined materials
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