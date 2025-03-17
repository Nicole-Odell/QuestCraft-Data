scoreboard players set @s temperature.environmentCurrent -1

execute if predicate questcraft:is_in_water run scoreboard players set @s temperature.environmentCurrent -2

function questcraft:environment_player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1