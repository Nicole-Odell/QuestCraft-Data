# Will ensure that all villagers in trading range of the player are inited

# Get the poi type as a score so we know it when we are executing in the villager's context
scoreboard players operation _currentPoiType var = @s currentPoiType

# Init all villagers close to the player
scoreboard players set _any_villager_inited var 0
execute as @e[type=minecraft:villager,tag=villager_inited_incomplete,distance=..5] at @s run function questcraft:villager/init
execute as @e[type=minecraft:villager,tag=!villager_inited,distance=..5] at @s run function questcraft:villager/init

scoreboard players reset _currentPoiType var
scoreboard players reset _any_villager_inited var