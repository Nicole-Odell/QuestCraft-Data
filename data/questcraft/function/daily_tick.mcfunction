# If any players are in a POI, attempt to initialize any incomplete villagers
execute if score _day_time var matches 0 as @a unless score @s currentPoiType matches 0 at @s run function questcraft:villager/poi_init_villagers

# Trigger effects of sleeping for players 
execute if score _day_time var matches 1 as @a if score @s timeSinceLastRest matches 1 at @s run function questcraft:player/slept