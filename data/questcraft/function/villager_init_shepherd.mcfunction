# No biome-specific trades

# Shepherds will always sell white wool, leads, and string
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:white_wool,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:8},sell:{id:lead,count:1},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:string,count:12},maxUses:99999}

# Shepherds have a chance to sell other wool colors based on that sheep's rarity
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:1000}
execute if score _random_val var matches 0..200 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:light_gray_wool,count:4},maxUses:99999}
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:1000}
execute if score _random_val var matches 0..200 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:gray_wool,count:4},maxUses:99999}
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:1000}
execute if score _random_val var matches 0..200 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:black_wool,count:4},maxUses:99999}
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:1000}
execute if score _random_val var matches 0..120 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:brown_wool,count:4},maxUses:99999}
execute store result score _random_val var run function questcraft:get_random_in_range {randMin:0,randMax:1000}
execute if score _random_val var matches 0..4 run data modify entity @s Offers.Recipes append value {buy:{id:emerald,count:1},sell:{id:pink_wool,count:2},maxUses:99999}

# Shepherds will always buy leads and any color of wool
data modify entity @s Offers.Recipes append value {buy:{id:lead,count:1},sell:{id:emerald,count:4},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:white_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:orange_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:magenta_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:light_blue_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:yellow_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:lime_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:pink_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:gray_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:light_gray_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:cyan_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:purple_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:blue_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:brown_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:green_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:red_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}
data modify entity @s Offers.Recipes append value {buy:{id:black_wool,count:1},sell:{id:emerald,count:2},maxUses:99999}

scoreboard players reset _random_val var