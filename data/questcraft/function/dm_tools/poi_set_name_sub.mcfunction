$execute store success score _successful var as @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..256] run data modify entity @s CustomName set value "$(newName)"

$execute if score _successful var matches 1 run tell @s Renamed $(structure_type_name) to "$(newName)"

$execute unless score _successful var matches 1 run tell @s Error - Failed to rename $(structure_type_name)! It may already be named "$(newName)"

scoreboard players reset _successful var