# Crossbows
execute store result score _random_val var run function questcraft:utilities/get_random_in_range {randMin:0,randMax:289}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..144 run scoreboard players add _random_val var 145
execute if score _random_val var matches 145..169 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:enchanted_book,count:1,components:{enchantments:{quick_charge:1}}},maxUses:4}
execute if score _random_val var matches 170..184 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{quick_charge:2}}},maxUses:2}
execute if score _random_val var matches 185..194 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{quick_charge:3}}},maxUses:1}

execute if score _random_val var matches 195..229 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:10},sell:{id:enchanted_book,count:1,components:{enchantments:{piercing:1}}},maxUses:8}
execute if score _random_val var matches 230..254 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:18},sell:{id:enchanted_book,count:1,components:{enchantments:{piercing:2}}},maxUses:4}
execute if score _random_val var matches 255..269 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{piercing:3}}},maxUses:2}
execute if score _random_val var matches 270..279 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:48},sell:{id:enchanted_book,count:1,components:{enchantments:{piercing:4}}},maxUses:1}

execute if score _random_val var matches 280..289 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:32},sell:{id:enchanted_book,count:1,components:{enchantments:{multishot:1}}},maxUses:1}

scoreboard players reset _random_val var