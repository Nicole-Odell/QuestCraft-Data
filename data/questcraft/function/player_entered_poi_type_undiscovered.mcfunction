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

# We broadcast first-time discoveries to all players
$title @a subtitle {"color":"#CDC06E","text":"Discovered New $(structure_type_name)"}
title @a title {"italic":true,"color":"#BDBDBD","storage":"questcraft:args","nbt":"structure_name"}

# If we failed to mark the poi, we will continue to try until we do
$execute unless entity @e[type=minecraft:marker,tag=poi_marker,tag=poi_marker_$(structure_type),distance=..128] run advancement revoke @s only questcraft:entered_poi

data remove storage questcraft:args structure_name