# Subtract 16 from the current distance to get the new radius we are checking
scoreboard players operation _poi_search_distance var -= _poi_search_resolution var

# If we haven't converged and we reached the middle, we failed
execute if score _poi_search_distance var matches ..0 run return fail

# tp the markers inwards by 16 if they are not yet in the structure
scoreboard players set _poi_search_locator_moved var 0
$execute as @n[type=marker,tag=poi_locater_n_x] at @s unless predicate $(structure_predicate) run function questcraft:poi/triangulate_center_step_sub with storage questcraft:args
$execute as @n[type=marker,tag=poi_locater_p_x] at @s unless predicate $(structure_predicate) run function questcraft:poi/triangulate_center_step_sub with storage questcraft:args
$execute as @n[type=marker,tag=poi_locater_n_z] at @s unless predicate $(structure_predicate) run function questcraft:poi/triangulate_center_step_sub with storage questcraft:args
$execute as @n[type=marker,tag=poi_locater_p_z] at @s unless predicate $(structure_predicate) run function questcraft:poi/triangulate_center_step_sub with storage questcraft:args

# Debug
# say ===================================================================
# function questcraft:debug/print_var_force {var:_poi_search_distance}
# execute at @s store result score _poi_search_locater_n_x var run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[0]
# execute at @s store result score _poi_search_locater_p_x var run data get entity @n[type=marker,tag=poi_locater_p_x] Pos[0]
# execute at @s store result score _poi_search_locater_n_z var run data get entity @n[type=marker,tag=poi_locater_n_z] Pos[2]
# execute at @s store result score _poi_search_locater_p_z var run data get entity @n[type=marker,tag=poi_locater_p_z] Pos[2]
# function questcraft:debug/print_var_force {var:_poi_search_locater_n_x}
# function questcraft:debug/print_var_force {var:_poi_search_locater_p_x}
# function questcraft:debug/print_var_force {var:_poi_search_locater_n_z}
# function questcraft:debug/print_var_force {var:_poi_search_locater_p_z}
# function questcraft:debug/print_var_force {var:_poi_search_locator_moved}
# execute if score _poi_search_locator_moved var matches 0 run say ##! FOUND !##
# say ===================================================================


execute if score _poi_search_locator_moved var matches 0 run return 1

# If we moved at least 1 marker, recurse and continue stepping them inwards
execute unless score _poi_search_locator_moved var matches 0 run function questcraft:poi/triangulate_center_step with storage questcraft:args