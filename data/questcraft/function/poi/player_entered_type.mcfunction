# If the player was already in the POI type, we don't need to do anything else
$execute if score @s currentPoiType matches $(structure_type_id) run return 1

# Set the player's current POI type to the new one
$scoreboard players set @s currentPoiType $(structure_type_id)


# Already discovered
$execute if entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..160] run function questcraft:poi/player_entered_type_discovered with storage questcraft:args

# Newly Discovered
$execute unless entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..160] run function questcraft:poi/player_entered_type_undiscovered with storage questcraft:args

# Call the type-specific function in case there is anything specific to do
$function questcraft:poi/player_entered_$(structure_type) with storage questcraft:args