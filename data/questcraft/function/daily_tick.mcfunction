# If any players are in a POI, attempt to initialize any incomplete villagers
execute if score _day_time var matches 0 as @a unless score @s currentPoiType matches 0 at @s run function questcraft:poi_init_villagers

execute if score _day_time var matches 0..1 as @a if score @s timeSinceLastRest matches 0..1 at @s run function questcraft:player_slept