# Will ensure that all villagers in the kingdom are initted

# Get the poi type as a score so we know it when we are executing in the villager's context
scoreboard players operation _currentPoiType var = @s currentPoiType

# Init all villagers within the poi
scoreboard players set _any_villager_inited var 0
execute as @e[type=minecraft:villager,tag=villager_inited_incomplete,distance=..160] at @s run function questcraft:villager/init
execute as @e[type=minecraft:villager,tag=!villager_inited,distance=..160] at @s run function questcraft:villager/init

scoreboard players reset _currentPoiType var
scoreboard players reset _any_villager_inited var