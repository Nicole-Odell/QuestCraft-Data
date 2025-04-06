# Get the subtype of the structure, if there is one
data modify storage questcraft:args structure_type_subtype set value "all"
# Kingdom
execute if score _structure_type_id var matches 2 if predicate questcraft:is_in_poi_kingdom_plains run data modify storage questcraft:args structure_type_subtype set value "plains"
execute if score _structure_type_id var matches 2 if predicate questcraft:is_in_poi_kingdom_forest run data modify storage questcraft:args structure_type_subtype set value "forest"
execute if score _structure_type_id var matches 2 if predicate questcraft:is_in_poi_kingdom_desert run data modify storage questcraft:args structure_type_subtype set value "desert"
# Tavern
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_acacia run data modify storage questcraft:args structure_type_subtype set value "acacia"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_birch run data modify storage questcraft:args structure_type_subtype set value "birch"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_cherry run data modify storage questcraft:args structure_type_subtype set value "cherry"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_dark_oak run data modify storage questcraft:args structure_type_subtype set value "dark_oak"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_desert run data modify storage questcraft:args structure_type_subtype set value "desert"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_jungle run data modify storage questcraft:args structure_type_subtype set value "jungle"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_mangrove run data modify storage questcraft:args structure_type_subtype set value "mangrove"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_oak run data modify storage questcraft:args structure_type_subtype set value "oak"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_snowy run data modify storage questcraft:args structure_type_subtype set value "snowy"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_spruce run data modify storage questcraft:args structure_type_subtype set value "spruce"
execute if score _structure_type_id var matches 4 if predicate questcraft:is_in_poi_tavern_swamp run data modify storage questcraft:args structure_type_subtype set value "swamp"
# Village
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_birch run data modify storage questcraft:args structure_type_subtype set value "birch"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_desert run data modify storage questcraft:args structure_type_subtype set value "desert"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_jungle run data modify storage questcraft:args structure_type_subtype set value "jungle"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_plains run data modify storage questcraft:args structure_type_subtype set value "plains"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_savanna run data modify storage questcraft:args structure_type_subtype set value "savanna"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_snowy run data modify storage questcraft:args structure_type_subtype set value "snowy"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_swamp run data modify storage questcraft:args structure_type_subtype set value "swamp"
execute if score _structure_type_id var matches 6 if predicate questcraft:is_in_poi_village_taiga run data modify storage questcraft:args structure_type_subtype set value "taiga"

# Mark the POI. This will also assign the structure a name from the list
execute at @s run function questcraft:poi_mark_center with storage questcraft:args

# Check that we succeeded in marking the POI
$execute if entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..256] run scoreboard players set _marked_poi var 1

# If we succeeded, we broadcast first-time discoveries to all players
$execute if score _marked_poi var matches 1 run title @a subtitle {"color":"#CDC06E","text":"Discovered New $(structure_type_name)"}
execute if score _marked_poi var matches 1 run title @a title {"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_name"}

# If we failed to mark the poi, we will continue to try until we do. Revoke the entered advancemant and reset their POI type to do so
execute unless score _marked_poi var matches 1 run advancement revoke @s only questcraft:entered_poi
execute unless score _marked_poi var matches 1 run scoreboard players set @s currentPoiType 0
execute unless score _marked_poi var matches 1 run tell @a[tag=admin] POI mark failed!

# If we succeeded, track the current safe status (safe (1), normal (0), or hostile (-1)) and name in playerData for the actionbar title
$execute if score _marked_poi var matches 1 run data modify storage questcraft:player_data players[$(playerId)].currentPoiName set from storage questcraft:args structure_name
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 1 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 2 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 3 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 4 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 5 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value -1
$execute if score _marked_poi var matches 1 if score _structure_type_id var matches 6 run data modify storage questcraft:player_data players[$(playerId)].currentPoiSafeStatus set value 1

scoreboard players reset _marked_poi var

data remove storage questcraft:args structure_name
data remove storage questcraft:args structure_type_subtype