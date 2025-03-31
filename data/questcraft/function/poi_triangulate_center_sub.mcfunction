# make sure there aren't any left over markers to get in our way
kill @e[type=marker,tag=poi_locater]

# Summon the markers at the right points
$execute at @s run summon marker ~-$(poi_search_distance) ~ ~ {Tags:["poi_locater","poi_locater_n_x"]}
execute as @n[type=marker,tag=poi_locater_n_x] at @s positioned over world_surface run tp @s ~ ~ ~
$execute at @s run summon marker ~$(poi_search_distance) ~ ~ {Tags:["poi_locater","poi_locater_p_x"]}
execute as @n[type=marker,tag=poi_locater_p_x] at @s positioned over world_surface run tp @s ~ ~ ~
$execute at @s run summon marker ~ ~ ~-$(poi_search_distance) {Tags:["poi_locater","poi_locater_n_z"]}
execute as @n[type=marker,tag=poi_locater_n_z] at @s positioned over world_surface run tp @s ~ ~ ~
$execute at @s run summon marker ~ ~ ~$(poi_search_distance) {Tags:["poi_locater","poi_locater_p_z"]}
execute as @n[type=marker,tag=poi_locater_p_z] at @s positioned over world_surface run tp @s ~ ~ ~

# execute store result storage questcraft:args x int 1 run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[0]
# execute store result storage questcraft:args y int 1 run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[1]
# execute store result storage questcraft:args z int 1 run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[2]
# function questcraft:debug_print_coords_force with storage questcraft:args
# execute store result storage questcraft:args x int 1 run data get entity @n[type=marker,tag=poi_locater_p_x] Pos[0]
# execute store result storage questcraft:args y int 1 run data get entity @n[type=marker,tag=poi_locater_p_x] Pos[1]
# execute store result storage questcraft:args z int 1 run data get entity @n[type=marker,tag=poi_locater_p_x] Pos[2]
# function questcraft:debug_print_coords_force with storage questcraft:args
# execute store result storage questcraft:args x int 1 run data get entity @n[type=marker,tag=poi_locater_n_z] Pos[0]
# execute store result storage questcraft:args y int 1 run data get entity @n[type=marker,tag=poi_locater_n_z] Pos[1]
# execute store result storage questcraft:args z int 1 run data get entity @n[type=marker,tag=poi_locater_n_z] Pos[2]
# function questcraft:debug_print_coords_force with storage questcraft:args
# execute store result storage questcraft:args x int 1 run data get entity @n[type=marker,tag=poi_locater_p_z] Pos[0]
# execute store result storage questcraft:args y int 1 run data get entity @n[type=marker,tag=poi_locater_p_z] Pos[1]
# execute store result storage questcraft:args z int 1 run data get entity @n[type=marker,tag=poi_locater_p_z] Pos[2]
# function questcraft:debug_print_coords_force with storage questcraft:args

# Start the recursion
execute at @s run function questcraft:poi_triangulate_center_step with storage questcraft:args
scoreboard players reset _poi_search_locator_moved var

# If we never stopped converging (i.e. one or more markers never reached the structure), we failed. Report this and clean up
execute if score _poi_search_locator_moved var matches 1 run return fail

# With the recursion completed, we should have all markers at the edge of the structure.
# Find the center of them
execute at @s store result score _poi_search_locater_n_x var run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[0]
execute at @s store result score _poi_search_locater_p_x var run data get entity @n[type=marker,tag=poi_locater_p_x] Pos[0]
execute at @s store result score _poi_search_locater_n_z var run data get entity @n[type=marker,tag=poi_locater_n_z] Pos[2]
execute at @s store result score _poi_search_locater_p_z var run data get entity @n[type=marker,tag=poi_locater_p_z] Pos[2]

# Average the coords
scoreboard players operation _poi_search_avg_x var = _poi_search_locater_n_x var
scoreboard players operation _poi_search_avg_x var += _poi_search_locater_p_x var
scoreboard players operation _poi_search_avg_z var = _poi_search_locater_n_z var
scoreboard players operation _poi_search_avg_z var += _poi_search_locater_p_z var

scoreboard players set _c_2 var 2
scoreboard players operation _poi_search_avg_x var /= _c_2 var
scoreboard players operation _poi_search_avg_z var /= _c_2 var

# tp one of the markers to the center, then to the surface, to get the final surface center y value
execute store result storage questcraft:args x int 1 run scoreboard players get _poi_search_avg_x var
data modify storage questcraft:args y set value 64
execute store result storage questcraft:args z int 1 run scoreboard players get _poi_search_avg_z var
execute at @s as @n[type=marker,tag=poi_locater_n_x] run function questcraft:tp_to_loc_surface with storage questcraft:args
execute at @s store result score _poi_search_avg_y var run data get entity @n[type=marker,tag=poi_locater_n_x] Pos[1]

# Clean up the markers
execute at @s as @n[type=marker,tag=poi_locater] run kill @s

# Record the center. These function as out paramaters so we don't reset them here
execute store result storage questcraft:args poiCenterX int 1 run scoreboard players get _poi_search_avg_x var
execute store result storage questcraft:args poiCenterY int 1 run scoreboard players get _poi_search_avg_y var
execute store result storage questcraft:args poiCenterZ int 1 run scoreboard players get _poi_search_avg_z var

# Debug
say Final:
execute store result storage questcraft:args x int 1 run scoreboard players get _poi_search_avg_x var
execute store result storage questcraft:args y int 1 run scoreboard players get _poi_search_avg_y var
execute store result storage questcraft:args z int 1 run scoreboard players get _poi_search_avg_z var
function questcraft:debug_print_coords_force with storage questcraft:args


scoreboard players reset _poi_search_locator_moved var
scoreboard players reset _poi_search_locater_n_x var
scoreboard players reset _poi_search_locater_p_x var
scoreboard players reset _poi_search_locater_n_y var
scoreboard players reset _poi_search_locater_p_y var
scoreboard players reset _poi_search_locater_n_z var
scoreboard players reset _poi_search_locater_p_z var
scoreboard players reset _poi_search_avg_x var
scoreboard players reset _poi_search_avg_y var
scoreboard players reset _poi_search_avg_z var
scoreboard players reset _c_2 var

data remove storage questcraft:args x
data remove storage questcraft:args y
data remove storage questcraft:args z
