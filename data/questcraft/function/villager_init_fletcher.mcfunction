# Biome-specific trades

# desert
# Nothing special

# jungle
execute if score _villager_type var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_poison},rarity:uncommon},count:2},maxUses:99999}

# plains
# Nothing special

# savanna
# Nothing special

# snow
execute if score _villager_type var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_slowness},rarity:uncommon},count:2},maxUses:99999}

# swamp
execute if score _villager_type var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:long_poison},rarity:uncommon},count:2},maxUses:99999}

# taiga 
# Nothing special


# Fletchers will always sell arrows
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:arrow,count:8},maxUses:99999}

# Fletchers have a chance to sell enchanted bows and crossbows. Fletchers in kingdoms always do

# Base bow. 50/50 chance
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:19}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..9 run scoreboard players add _random_val var 10
execute if score _random_val var matches 10.. run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:bow,count:1},maxUses:99999}
# 25% chance for an enchanted bow (50/50 for kingdom)
execute if score _random_val var matches 15.. run scoreboard players set _do_ench_bow var 1

# Determine which enchanted bow to give
execute if score _do_ench_bow var matches 1 store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:119}

# Power 1-5
execute if score _do_ench_bow var matches 1 if score _random_val var matches 0..24 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:bow,components:{rarity:rare,enchantments:{power:1}},count:1},maxUses:99999}
execute if score _do_ench_bow var matches 1 if score _random_val var matches 25..44 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:26},sell:{id:bow,components:{rarity:rare,enchantments:{power:2}},count:1},maxUses:99999}
execute if score _do_ench_bow var matches 1 if score _random_val var matches 45..59 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:34},sell:{id:bow,components:{rarity:rare,enchantments:{power:3}},count:1},maxUses:99999}
execute if score _do_ench_bow var matches 1 if score _random_val var matches 60..69 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:bow,components:{rarity:rare,enchantments:{power:4}},count:1},maxUses:99999}
execute if score _do_ench_bow var matches 1 if score _random_val var matches 70..74 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:bow,components:{rarity:rare,enchantments:{power:5}},count:1},maxUses:99999}

# Punch 1-2
execute if score _do_ench_bow var matches 1 if score _random_val var matches 75..94 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:24},sell:{id:bow,components:{rarity:rare,enchantments:{punch:1}},count:1},maxUses:99999}
execute if score _do_ench_bow var matches 1 if score _random_val var matches 95..104 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:bow,components:{rarity:rare,enchantments:{punch:2}},count:1},maxUses:99999}

# Flame
execute if score _do_ench_bow var matches 1 if score _random_val var matches 105..119 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:28},sell:{id:bow,components:{rarity:rare,enchantments:{flame:1}},count:1},maxUses:99999}

# execute if score _random_val var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:tipped_arrow,components:{potion_contents:{potion:strong_harming},custom_name:'{"text":"Blooded Arrow"}',lore:['{"text":"Damages normal targets more than a normal arrow, but heals undead"}'],rarity:rare,custom_model_data:1},count:2},maxUses:99999}

# Fletcher will always buy arrows, flint, and feathers
data modify entity @s Offers.Recipes append value {buy:{id:feather,count:4},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:flint,count:8},sell:{id:emerald,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:arrow,count:16},sell:{id:emerald,count:1},maxUses:99999}

scoreboard players reset _random_val var
scoreboard players reset _do_ench_bow var