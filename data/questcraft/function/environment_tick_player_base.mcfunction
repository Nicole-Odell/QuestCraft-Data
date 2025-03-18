# Get the current temperature as a representation of where in the meter it is
execute if score @s temperature.current < _globals temperature.freezingThreshold run scoreboard players set _temperature_current_level var -2
execute if score @s temperature.current >= _globals temperature.freezingThreshold if score @s temperature.current < _globals temperature.coldThreshold run scoreboard players set _temperature_current_level var -1
execute if score @s temperature.current >= _globals temperature.coldThreshold if score @s temperature.current < _globals temperature.hotThreshold run scoreboard players set _temperature_current_level var 0
execute if score @s temperature.current >= _globals temperature.hotThreshold if score @s temperature.current <= _globals temperature.overheatingThreshold run scoreboard players set _temperature_current_level var 1
execute if score @s temperature.current > _globals temperature.overheatingThreshold run scoreboard players set _temperature_current_level var 2

execute store success score _is_exposed_to_sky var run execute if predicate questcraft:is_exposed_to_sky
execute store success score _is_precipitating var run execute if predicate questcraft:is_raining
execute store success score _is_in_water var run execute if predicate questcraft:is_in_water
execute store success score _is_in_rainy_biome var run execute if predicate questcraft:is_in_rainy_biome
# _is_snowing will technically also be true in deserts, but we don't check it for those biomes.
# Not being specific here saves us some performance by not having another predicate or check for is_desert
scoreboard players set _is_snowing var 0
execute store success score _is_snowing var run execute if score _is_in_rainy_biome var matches 0 if score _is_precipitating var matches 1

# Apply wetness if the player is in water, or if it is raining and they are exposed to sky in a rainy biome. Clamp it at the max value
execute if score _is_in_water var matches 1 if score @s wetness.current < _globals wetness.max run scoreboard players operation @s wetness.current += _globals wetness.waterWetSpeed
execute if score _is_precipitating var matches 1 if score _is_in_rainy_biome var matches 1 if score _is_exposed_to_sky var matches 1 if score @s wetness.current < _globals wetness.max run scoreboard players operation @s wetness.current += _globals wetness.rainWetSpeed
execute if score @s wetness.current > _globals wetness.max run scoreboard players operation @s wetness.current = _globals wetness.max

# Determine what environment temperature to use based on the time of day
execute store success score _is_day_temperature var run execute if predicate questcraft:is_day_temperature
execute store success score _is_night_temperature var run execute if predicate questcraft:is_night_temperature
# Switch based on time of day
execute if score _is_day_temperature var matches 1 run function questcraft:environment_tick_player_day_temperature
execute if score _is_night_temperature var matches 1 run function questcraft:environment_tick_player_night_temperature
execute if score _is_day_temperature var matches 0 if score _is_night_temperature var matches 0 run function questcraft:environment_tick_player_neutral_temperature

# The above functions will set temperature.wasEvaluatedThisTick to 1 if they applied. If not, the temperature should begin to return to baseline
execute unless score @s temperature.wasEvaluatedThisTick matches 1 run function questcraft:environment_player_neutral

# Update the display of the temperature meter
function questcraft:environment_player_temperature_meter_display

scoreboard players reset _temperature_current_level var
scoreboard players reset _is_exposed_to_sky var
scoreboard players reset _is_precipitating var
scoreboard players reset _is_in_water var
scoreboard players reset _is_in_rainy_biome var
scoreboard players reset _is_snowing var
scoreboard players reset _is_day_temperature var
scoreboard players reset _is_night_temperature var