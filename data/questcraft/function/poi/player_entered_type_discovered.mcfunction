# Determine if this POI has been amrked as artificially undiscovered
$execute if entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),tag=poi_marker_undiscovered,distance=..256] run scoreboard players set _marked_undiscovered var 1

# Retrieve the POI  name
$data modify storage questcraft:args structure_name set string entity @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..256] CustomName 1 -1

# Artificially marked as undiscovered. We broadcast first-time discoveries to all players
$execute if score _marked_undiscovered var matches 1 run title @a subtitle {"color":"#CDC06E","text":"Discovered New $(structure_type_name)"}
execute if score _marked_undiscovered var matches 1 run title @a title {"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_name"}
# Clean up the discovered marker
$execute if score _marked_undiscovered var matches 1 as @n[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),tag=poi_marker_undiscovered,distance=..256] run tag @s remove poi_marker_undiscovered

# Announce entering the already-discovered POI
execute unless score _marked_undiscovered var matches 1 run title @s subtitle [{"italic":true,"color":"#BDBDBD","text":"Entering "},{"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_type_name"},{"italic":true,"color":"#BDBDBD","text":"  -  "},{"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_name"}]
execute unless score _marked_undiscovered var matches 1 run title @s title ""

# If we succeeded, track the current safe status (safe (1), normal (0), or hostile (-1)) and name in playerData for the actionbar title
$data modify storage questcraft:player_data players[$(playerId)].currentPoiName set from storage questcraft:args structure_name
$execute if score _structure_type_id var matches 1 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _structure_type_id var matches 2 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1
$execute if score _structure_type_id var matches 3 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _structure_type_id var matches 4 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1
$execute if score _structure_type_id var matches 5 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _structure_type_id var matches 6 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1

scoreboard players reset _marked_undiscovered var

data remove storage questcraft:args structure_name