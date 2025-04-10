# Reset Temperature, Hydration, and Wetness to default on death
scoreboard players set @s hydration.current 0
scoreboard players operation @s temperature.current = _globals temperature.midpoint
scoreboard players set @s wetness.current 0

# Reset Any status effects
tag @s remove status_frozen
scoreboard players set @s frozenTime 0

# Mage-Specific reset
execute if score @s isMage matches 1 run execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
execute if score @s isMage matches 1 run function questcraft:player/status_reset_mage with storage questcraft:args
execute if score @s isMage matches 1 run data remove storage questcraft:args mageId