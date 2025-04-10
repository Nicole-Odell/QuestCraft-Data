$execute if entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),tag=poi_marker_undiscovered,distance=..256] run return run tell @s $(structure_type_name) is already marked as undiscovered

$execute store success score _successful var as @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),tag=!poi_marker_undiscovered,distance=..256] run tag @s add poi_marker_undiscovered

$execute if score _successful var matches 1 run tell @s Marked $(structure_type_name) as undiscovered

$execute unless score _successful var matches 1 run tell @s Error - Failed to mark $(structure_type_name) as undiscovered!

scoreboard players reset _successful var