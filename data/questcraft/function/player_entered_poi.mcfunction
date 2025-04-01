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


# Set the proper args for the structure type
execute if score _structure_type_id var matches 1 run data modify storage questcraft:args structure_type set value "castle"
execute if score _structure_type_id var matches 1 run data modify storage questcraft:args structure_type_name set value "Fortress"

execute if score _structure_type_id var matches 2 run data modify storage questcraft:args structure_type set value "kingdom"
execute if score _structure_type_id var matches 2 run data modify storage questcraft:args structure_type_name set value "Kingdom"

execute if score _structure_type_id var matches 3 run data modify storage questcraft:args structure_type set value "mansion"
execute if score _structure_type_id var matches 3 run data modify storage questcraft:args structure_type_name set value "Mansion"

execute if score _structure_type_id var matches 4 run data modify storage questcraft:args structure_type set value "tavern"
execute if score _structure_type_id var matches 4 run data modify storage questcraft:args structure_type_name set value "Tavern"

execute if score _structure_type_id var matches 5 run data modify storage questcraft:args structure_type set value "tower"
execute if score _structure_type_id var matches 5 run data modify storage questcraft:args structure_type_name set value "Mage Tower"

execute if score _structure_type_id var matches 6 run data modify storage questcraft:args structure_type set value "village"
execute if score _structure_type_id var matches 6 run data modify storage questcraft:args structure_type_name set value "Village"

# Handle them entering the structure
function questcraft:player_entered_poi_type with storage questcraft:args

# Mark them as being in a POI
scoreboard players set @s isInPoi 1

scoreboard players reset _was_not_in_poi_type var
scoreboard players reset _structure_type_id var

data remove storage questcraft:args playerId
data remove storage questcraft:args structure_type_id
data remove storage questcraft:args structure_type
data remove storage questcraft:args structure_type_name


advancement revoke @s only questcraft:entered_poi
# Revoke exited here too, since it won't revoke itself if we go away from any POIs, to save performance
advancement revoke @s only questcraft:exited_poi