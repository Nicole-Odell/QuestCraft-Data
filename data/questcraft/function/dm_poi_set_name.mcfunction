execute if score @s currentPoiType matches 0 run return run tell @s Not curently in a POI, cannot rename

# Set the proper args for the structure type. This sets structure_type and structure_type_name
execute store result storage questcraft:args structure_type_id int 1 run scoreboard players get @s currentPoiType
function questcraft:poi_get_structure_details_from_id with storage questcraft:args

# Save the passed name
$data modify storage questcraft:args newName set value "$(newName)"

function questcraft:dm_poi_set_name_sub with storage questcraft:args

data remove storage questcraft:args structure_type_id
data remove storage questcraft:args structure_type
data remove storage questcraft:args structure_type_name
data remove storage questcraft:args newName