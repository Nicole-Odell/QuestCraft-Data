# Reset to 0 on death
execute if score @s health matches 0 run scoreboard players set @s wetness.current 0

execute if score @s wetness.current matches 0 run return 1

# Get the amount to dry the player by. We shift by the minimum environment temp that we will dry off in (-2) to get positive values only
scoreboard players operation _wetness_delta var = _wetness_effective_temperature_current var
scoreboard players add _wetness_delta var 2
# Then multiply by the dry speed scalar
scoreboard players operation _wetness_delta var *= _globals wetness.drySpeed

# We dry faster if wet than if damp
scoreboard players set _c_2 var 2
execute if score @s wetness.current > _globals wetness.wetThreshold run scoreboard players operation _wetness_delta var *= _c_2 var

# Assuming we have a valid (positve, nonzero) delta, apply the change to the player's wetness
execute if score _wetness_delta var matches 1.. run scoreboard players operation @s wetness.current -= _wetness_delta var
# Clamp final wetness at 0
execute if score @s wetness.current matches ..-1 run scoreboard players set @s wetness.current 0

scoreboard players reset _wetness_delta var
scoreboard players reset _c_2 var

