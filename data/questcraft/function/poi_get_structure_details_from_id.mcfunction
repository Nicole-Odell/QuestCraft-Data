# Get the passed structure type id as a score
$scoreboard players set _structure_type_id var $(structure_type_id)

# Set the proper args for the structure type
execute if score _structure_type_id var matches 0 run data modify storage questcraft:args structure_type set value "none"
execute if score _structure_type_id var matches 0 run data modify storage questcraft:args structure_type_name set value "Unset Structure"

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

scoreboard players reset _structure_type_id var