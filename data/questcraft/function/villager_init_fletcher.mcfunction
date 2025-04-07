# Set their name so they are easier to find
data modify entity @s CustomName set value '[{"text":"🏹 "},{"translate":"entity.minecraft.villager.fletcher"}]'
data modify entity @s CustomNameVisible set value true

# Biome-specific trades

# desert
execute if score _villager_type var matches 0 run function questcraft:villager_init_fletcher_harsh_biome

# jungle
execute if score _villager_type var matches 1 run function questcraft:villager_init_fletcher_normal_biome
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_poison},rarity:uncommon},count:2},maxUses:99999}

# plains
execute if score _villager_type var matches 2 run function questcraft:villager_init_fletcher_normal_biome

# savanna
execute if score _villager_type var matches 3 run function questcraft:villager_init_fletcher_normal_biome

# snow
execute if score _villager_type var matches 4 run function questcraft:villager_init_fletcher_harsh_biome
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_slowness},rarity:uncommon},count:2},maxUses:99999}

# swamp
execute if score _villager_type var matches 5 run function questcraft:villager_init_fletcher_harsh_biome
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_poison},rarity:uncommon},count:2},maxUses:99999}

# taiga 
execute if score _villager_type var matches 6 run function questcraft:villager_init_fletcher_harsh_biome


# Fletchers will always sell regular arrows
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:arrow,count:8},maxUses:99999}

# execute if score _random_val var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:strong_harming},custom_name:'{"text":"Blooded Arrow"}',lore:['{"text":"Damages normal targets more than a normal arrow, but heals undead"}'],rarity:rare,custom_model_data:1},count:2},maxUses:99999}

# Fletchers will always buy bows and crossbows as well as arrows, flint, feathers, and string
data modify entity @s Offers.Recipes append value {buy:{id:crossbow,count:1},sell:{id:emerald,count:10},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:bow,count:1},sell:{id:emerald,count:8},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:arrow,count:16},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:flint,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:feather,count:6},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:string,count:12},sell:{id:emerald,count:1},maxUses:99999}

scoreboard players reset _random_val var
scoreboard players reset _do_ench_bow var