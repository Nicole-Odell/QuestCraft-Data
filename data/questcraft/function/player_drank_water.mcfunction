advancement revoke @s only questcraft:drank_water

# Add water to the player's hydration value
execute if score @s hydration.current < _globals hydration.max run scoreboard players operation @s hydration.current += _globals hydration.drinkAmount
# Clamp it to the max value
execute if score @s hydration.current > _globals hydration.max run scoreboard players operation @s hydration.current = _globals hydration.max