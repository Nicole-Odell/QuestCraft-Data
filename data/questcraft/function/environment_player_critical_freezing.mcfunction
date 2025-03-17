scoreboard players set @s temperature.environmentCurrent -3

# execute if predicate questcraft:is_in_water run scoreboard players set @s temperature.environmentCurrent -4

function questcraft:environment_player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1