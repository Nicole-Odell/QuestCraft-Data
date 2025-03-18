scoreboard players set @s temperature.environmentCurrent 2

# If damp we are still hot. If wet we are comfortable.
execute if score @s wetness.current matches 1.. run scoreboard players set @s temperature.environmentCurrent 1
execute if score @s wetness.current > _globals wetness.wetThreshold run scoreboard players set @s temperature.environmentCurrent 0

# Set the effective environment temp used for wetness adjustment. Nearby warm block increases this value by 1
scoreboard players set _wetness_effective_temperature_current var 2
execute if score @s isNearWarmth matches 1 run scoreboard players add _wetness_effective_temperature_current var 1
execute unless score _is_in_water var matches 1 run function questcraft:environment_player_wetness_adjust

function questcraft:environment_player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1

scoreboard players reset _wetness_effective_temperature_current var