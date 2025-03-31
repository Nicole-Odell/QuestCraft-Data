$execute if entity @s[type=marker,tag=poi_locater_n_x] run tp @s ~$(poi_search_resolution) ~ ~
execute if entity @s[type=marker,tag=poi_locater_n_x] at @s positioned over world_surface run tp @s ~ ~ ~

$execute if entity @s[type=marker,tag=poi_locater_p_x] run tp @s ~-$(poi_search_resolution) ~ ~
execute if entity @s[type=marker,tag=poi_locater_p_x] at @s positioned over world_surface run tp @s ~ ~ ~

$execute if entity @s[type=marker,tag=poi_locater_n_z] run tp @s ~ ~ ~$(poi_search_resolution)
execute if entity @s[type=marker,tag=poi_locater_n_z] at @s positioned over world_surface run tp @s ~ ~ ~

$execute if entity @s[type=marker,tag=poi_locater_p_z] run tp @s ~ ~ ~-$(poi_search_resolution)
execute if entity @s[type=marker,tag=poi_locater_p_z] at @s positioned over world_surface run tp @s ~ ~ ~

scoreboard players set _poi_search_locator_moved var 1