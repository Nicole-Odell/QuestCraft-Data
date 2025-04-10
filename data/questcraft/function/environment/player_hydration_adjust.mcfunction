execute if score @s hydration.current matches 0 run return 1

# Get the amount to dry the player by. We shift by the minimum environment temp (-3) to get positive values only
scoreboard players operation _hydration_delta var = _wetness_effective_temperature_current var
scoreboard players add _hydration_delta var 3
# Then multiply by the dry speed scalar
scoreboard players operation _hydration_delta var *= _globals hydration.lossSpeed

# Assuming we have a valid (positve, nonzero) delta, apply the change to the player's hydration
execute if score _hydration_delta var matches 1.. run scoreboard players operation @s hydration.current -= _hydration_delta var
# Clamp final hydration at 0
execute if score @s hydration.current matches ..-1 run scoreboard players set @s hydration.current 0

scoreboard players reset _hydration_delta var