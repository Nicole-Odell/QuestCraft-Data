execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:15}

execute if score _random_val var matches 0 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:white_bed,count:1},maxUses:99999}
execute if score _random_val var matches 1 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:orange_bed,count:1},maxUses:99999}
execute if score _random_val var matches 2 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:magenta_bed,count:1},maxUses:99999}
execute if score _random_val var matches 3 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:light_blue_bed,count:1},maxUses:99999}
execute if score _random_val var matches 4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:yellow_bed,count:1},maxUses:99999}
execute if score _random_val var matches 5 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:lime_bed,count:1},maxUses:99999}
execute if score _random_val var matches 6 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:pink_bed,count:1},maxUses:99999}
execute if score _random_val var matches 7 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:gray_bed,count:1},maxUses:99999}
execute if score _random_val var matches 8 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:light_gray_bed,count:1},maxUses:99999}
execute if score _random_val var matches 9 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:cyan_bed,count:1},maxUses:99999}
execute if score _random_val var matches 10 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:purple_bed,count:1},maxUses:99999}
execute if score _random_val var matches 11 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:blue_bed,count:1},maxUses:99999}
execute if score _random_val var matches 12 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:brown_bed,count:1},maxUses:99999}
execute if score _random_val var matches 13 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:green_bed,count:1},maxUses:99999}
execute if score _random_val var matches 14 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:red_bed,count:1},maxUses:99999}
execute if score _random_val var matches 15 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:16},sell:{id:black_bed,count:1},maxUses:99999}

scoreboard players reset _random_val var
