advancement revoke @s only questcraft:started_villager_trading

# If the player is not in a POI, don't modify villager trades
# execute if score @s currentPoiType matches 0 run return fail

# Get the poi type as a score so we know it when we are executing in the villager's context
scoreboard players operation _currentPoiType var = @s currentPoiType

# Init all villagers within trading range of the player
scoreboard players set _any_villager_inited var 0
execute as @e[type=minecraft:villager,tag=!villager_inited,distance=..5] at @s run function questcraft:villager_init

scoreboard players reset _currentPoiType var
scoreboard players reset _any_villager_inited var