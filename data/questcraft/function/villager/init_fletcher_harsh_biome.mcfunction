# Fletchers in harsh biomes have a chance to sell crossbows and enchanted crossbows. Fletchers in kingdoms always at least sell crossbows and have a higher chance for enchanted crossbows

# Base crossbow. 50/50 chance
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:19}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..9 run scoreboard players add _random_val var 10
execute if score _random_val var matches 10.. run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:crossbow,count:1},maxUses:99999}
# 25% chance for an enchanted crossbow (50/50 for kingdom)
execute if score _random_val var matches 15.. run scoreboard players set _do_ench_crossbow var 1

# Determine which enchanted crossbow to give
execute if score _do_ench_crossbow var matches 1 store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:114}

# Quick Charge 1-3
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 0..24 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:34},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{quick_charge:1}},count:1},maxUses:1}
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 25..39 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{quick_charge:2}},count:1},maxUses:1}
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 40..44 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{quick_charge:3}},count:1},maxUses:1}

# Peircing 1-4
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 45..69 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:26},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{piercing:1}},count:1},maxUses:1}
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 70..84 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:34},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{piercing:2}},count:1},maxUses:1}
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 85..94 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{piercing:3}},count:1},maxUses:1}
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 95..99 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:64},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{piercing:4}},count:1},maxUses:1}

# Multishot
execute if score _do_ench_crossbow var matches 1 if score _random_val var matches 100..114 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:crossbow,components:{rarity:uncommon,enchantments:{multishot:1}},count:1},maxUses:1}

scoreboard players reset _random_val var
scoreboard players reset _do_ench_crossbow var