# Mark that the player is in the POI type. If this fails, we know they already were and we can just return early
$execute store success score _was_not_in_poi_type var run data modify storage questcraft:player_data players[$(playerId)].currentPoiType set value "village"
execute if score _was_not_in_poi_type var matches 0 run return 1

# Already discovered
execute if entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run title @s subtitle {"italic":true,"color":"#A4A4A4","text":"Lehrenburge"}
execute if entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run title @s title ""

# Newly Discovered
execute unless entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run title @s subtitle {"italic":true,"color":"#A4A4A4","text":"Lehrenburge"}
execute unless entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run title @s title {"color":"#CDC06E","text":"Discovered New Village"}
execute unless entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run function questcraft:poi_mark_center {structure_type:"village"}

# If we failed to mark the poi, we will continue to try until we do
execute unless entity @e[type=armor_stand,tag=poi_marker,tag=poi_marker_village,distance=..128] run advancement revoke @s only questcraft:entered_poi