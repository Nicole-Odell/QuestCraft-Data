# Banish all mobs within range of safe POIs. Spread it out across ticks for performance
execute if score _game_time_mod_40 var matches 0 as @a at @s run tag @n[type=marker,tag=poi_marker_kingdom,distance=..160] add poi_marker_tick
execute if score _game_time_mod_40 var matches 0 as @e[type=marker,tag=poi_marker_kingdom,tag=poi_marker_tick] at @s as @n[type=#questcraft:not_in_safe_areas,distance=..128] run function questcraft:utilities/banish_entity

execute if score _game_time_mod_40 var matches 14 as @a at @s run tag @n[type=marker,tag=poi_marker_village,distance=..160] add poi_marker_tick
execute if score _game_time_mod_40 var matches 14 as @e[type=marker,tag=poi_marker_village,tag=poi_marker_tick] at @s as @n[type=#questcraft:not_in_safe_areas,distance=..75] run function questcraft:utilities/banish_entity

execute if score _game_time_mod_40 var matches 27 as @a at @s run tag @n[type=marker,tag=poi_marker_tavern,distance=..160] add poi_marker_tick
execute if score _game_time_mod_40 var matches 27 as @e[type=marker,tag=poi_marker_tavern,tag=poi_marker_tick] at @s as @n[type=#questcraft:not_in_safe_areas,distance=..32] run function questcraft:utilities/banish_entity

execute if score _game_time_mod_40 var matches 0 as @e[type=marker,tag=poi_marker_kingdom,tag=poi_marker_tick] at @s unless entity @e[type=iron_golem,distance=..160] positioned over world_surface run summon iron_golem ~ ~ ~
execute if score _game_time_mod_40 var matches 14 as @e[type=marker,tag=poi_marker_village,tag=poi_marker_tick] at @s unless entity @e[type=iron_golem,distance=..160] positioned over world_surface run summon iron_golem ~ ~ ~

# Ensure there are always at least 5 golems in a kingdom, and 2 in a village. Taverns don't get shit.
execute if score _game_time_mod_100 var matches 8 as @a at @s run tag @n[type=marker,tag=poi_marker_kingdom,distance=..160] add poi_marker_tick
execute if score _game_time_mod_100 var matches 8 as @e[type=marker,tag=poi_marker_kingdom,tag=poi_marker_tick] at @s run function questcraft:poi/enforce_golems {maxGolems:5,spreadSeparation:16,spreadRange:72,checkRange:200}
execute if score _game_time_mod_100 var matches 58 as @a at @s run tag @n[type=marker,tag=poi_marker_village,distance=..160] add poi_marker_tick
execute if score _game_time_mod_100 var matches 58 as @e[type=marker,tag=poi_marker_village,tag=poi_marker_tick] at @s run function questcraft:poi/enforce_golems {maxGolems:2,spreadSeparation:4,spreadRange:48,checkRange:128}

tag @e[type=marker,tag=poi_marker_tick] remove poi_marker_tick