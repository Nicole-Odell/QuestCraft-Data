# Mark that the player is in the POI type. If this fails, we know they already were and we can just return early
$execute store success score _was_not_in_poi_type var run data modify storage questcraft:player_data players[$(playerId)].currentPoiType set value $(structure_type_id)
execute if score _was_not_in_poi_type var matches 0 run return 1

# Already discovered
$execute if entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..160] run function questcraft:player_entered_poi_type_discovered with storage questcraft:args

# Newly Discovered
$execute unless entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..160] run function questcraft:player_entered_poi_type_undiscovered with storage questcraft:args

# Call the type-specific function in case there is anything specific to do
$function questcraft:player_entered_poi_$(structure_type) with storage questcraft:args

# This advancement will be revoked when we exit this structure type