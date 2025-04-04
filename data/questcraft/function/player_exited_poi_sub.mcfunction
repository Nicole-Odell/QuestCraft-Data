# Reset their POI state if they are far enough away for their structure type
# Castle
execute if score @s currentPoiType matches 1 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_castle,distance=..256] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args
# Kingdom
execute if score @s currentPoiType matches 2 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_kingdom,distance=..128] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args
# Mansion
execute if score @s currentPoiType matches 3 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_mansion,distance=..256] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args
# Tavern
execute if score @s currentPoiType matches 4 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_tavern,distance=..64] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args
# Tower
execute if score @s currentPoiType matches 5 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_tower,distance=..48] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args
# Village
execute if score @s currentPoiType matches 6 unless entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_village,distance=..96] run function questcraft:player_exited_poi_sub_apply with storage questcraft:args