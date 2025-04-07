# Bows
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:239}
execute if score _currentPoiType var matches 2 if score _random_val var matches ..119 run scoreboard players add _random_val var 120
execute if score _random_val var matches 120..154 run data modify entity @s Offers.Recipes append value {buy:{id:emerald, count:8},sell:{id:enchanted_book,count:1,components:{enchantments:{power:1}}},maxUses:12}
execute if score _random_val var matches 155..179 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:14},sell:{id:enchanted_book,count:1,components:{enchantments:{power:2}}},maxUses:8}
execute if score _random_val var matches 180..194 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:22},sell:{id:enchanted_book,count:1,components:{enchantments:{power:3}}},maxUses:4}
execute if score _random_val var matches 195..204 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:36},sell:{id:enchanted_book,count:1,components:{enchantments:{power:4}}},maxUses:2}
execute if score _random_val var matches 205..209 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:52},sell:{id:enchanted_book,count:1,components:{enchantments:{power:5}}},maxUses:1}

execute if score _random_val var matches 210..224 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:12},sell:{id:enchanted_book,count:1,components:{enchantments:{punch:1}}},maxUses:2}
execute if score _random_val var matches 225..229 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:20},sell:{id:enchanted_book,count:1,components:{enchantments:{punch:2}}},maxUses:1}

execute if score _random_val var matches 230..239 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:enchanted_book,count:1,components:{enchantments:{flame:1}}},maxUses:1}

scoreboard players reset _random_val var