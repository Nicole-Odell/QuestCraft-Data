# Get the current temperature as a representation of where in the meter it is
execute if score @s temperature.current < _globals temperature.freezingThreshold run scoreboard players set _temperature_current_level var -2
execute if score @s temperature.current >= _globals temperature.freezingThreshold if score @s temperature.current < _globals temperature.coldThreshold run scoreboard players set _temperature_current_level var -1
execute if score @s temperature.current >= _globals temperature.coldThreshold if score @s temperature.current < _globals temperature.hotThreshold run scoreboard players set _temperature_current_level var 0
execute if score @s temperature.current >= _globals temperature.hotThreshold if score @s temperature.current <= _globals temperature.overheatingThreshold run scoreboard players set _temperature_current_level var 1
execute if score @s temperature.current > _globals temperature.overheatingThreshold run scoreboard players set _temperature_current_level var 2

execute store success score _is_exposed_to_sky var run execute if predicate questcraft:is_exposed_to_sky
execute store success score _is_snowing var run execute if predicate questcraft:is_raining

# Determine what environment temperature to use
execute if biome ~ ~ ~ #questcraft:is_burning run function questcraft:environment_player_burning

# is_hot depends on if you are in shade during the day
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_hot run function questcraft:environment_player_hot
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_hot run function questcraft:environment_player_neutral

# Desert depends on if you are in shade during the day
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment_player_burning
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment_player_hot

# is_cold is neutral during the day, but cold during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment_player_cold

# is_frozen is cold during the day, but freezing during snow if exposed to sky
execute store success score _is_snowing var run execute if predicate questcraft:is_raining
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 0 if biome ~ ~ ~ #questcraft:is_frozen run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_frozen run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_frozen run function questcraft:environment_player_freezing

# The above functions will set temperature.wasEvaluatedThisTick to 1 if they applied. If not, the temperature should begin to return to baseline
execute unless score @s temperature.wasEvaluatedThisTick matches 1 run function questcraft:environment_player_neutral

# Update the display of the temperature meter
function questcraft:environment_player_temperature_meter_display

scoreboard players reset _temperature_current_level var
scoreboard players reset _is_exposed_to_sky var
scoreboard players reset _is_snowing var