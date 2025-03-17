# Temperatures vary by day and night in some locations
scoreboard players reset * temperature.wasEvaluatedThisTick
scoreboard players set @a temperature.wasEvaluatedThisTick 0

execute if predicate questcraft:is_day_temperature as @a at @s run function questcraft:environment_tick_player_day_temperature
execute if predicate questcraft:is_night_temperature as @a at @s run function questcraft:environment_tick_player_night_temperature
execute unless predicate questcraft:is_day_temperature unless predicate questcraft:is_night_temperature as @a at @s run function questcraft:environment_tick_player_neutral_temperature