execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

# Get the type of structure they entered. 0 Represents no structure
scoreboard players set _structure_type_id var 0
execute if predicate questcraft:is_in_poi_castle run scoreboard players set _structure_type_id var 1
execute if predicate questcraft:is_in_poi_kingdom run scoreboard players set _structure_type_id var 2
execute if predicate questcraft:is_in_poi_mansion run scoreboard players set _structure_type_id var 3
execute if predicate questcraft:is_in_poi_tavern run scoreboard players set _structure_type_id var 4
execute if predicate questcraft:is_in_poi_tower run scoreboard players set _structure_type_id var 5
execute if predicate questcraft:is_in_poi_village run scoreboard players set _structure_type_id var 6
execute store result storage questcraft:args structure_type_id int 1 run scoreboard players get _structure_type_id var

# Set the proper args for the structure type. This sets structure_type and structure_type_name
function questcraft:poi_get_structure_details_from_id with storage questcraft:args

# Handle them entering the structure
function questcraft:player_entered_poi_type with storage questcraft:args

data remove storage questcraft:args playerId
data remove storage questcraft:args structure_type_id
data remove storage questcraft:args structure_type
data remove storage questcraft:args structure_type_name


advancement revoke @s only questcraft:entered_poi
# Revoke exited here too, since it won't revoke itself if we go away from any POIs, to save performance
advancement revoke @s only questcraft:exited_poi