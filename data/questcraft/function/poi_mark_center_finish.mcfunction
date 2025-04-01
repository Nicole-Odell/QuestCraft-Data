# Get the value of the last index in the list of available names for the POI
$execute store result score _unused_names_last_index var run data get storage questcraft:poi_data poiTypes.$(structure_type).names.$(structure_type_subtype)
scoreboard players remove _unused_names_last_index var 1

# Get a random index
data modify storage questcraft:args randMin set value 0 
execute store result storage questcraft:args randMax int 1 run scoreboard players get _unused_names_last_index var
execute store result storage questcraft:args structure_name_id int 1 run function questcraft:get_random_in_range with storage questcraft:args

# Place the marker and set the name
function questcraft:poi_mark_center_finish_sub with storage questcraft:args

function questcraft:debug_print_coords_force with storage questcraft:args

scoreboard players reset _unused_names_last_index var

data remove storage questcraft:args randMin
data remove storage questcraft:args randMax
data remove storage questcraft:args structure_name_id