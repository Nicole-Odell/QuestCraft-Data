# Retrieve the name and announce entering the POI
$data modify storage questcraft:args structure_name set string entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..128] CustomName 1 -1
title @s subtitle [{"color":"#BDBDBD","text":"Entering "},{"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_type_name"},{"color":"#BDBDBD","text":"  -  "},{"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_name"}]
title @s title ""

data remove storage questcraft:args structure_name