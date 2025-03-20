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

# Apply adverse effects for each temperature level
# Freezing to death - take damage every other second
execute if score _game_time_mod_40 var matches 0 if score @s temperature.current matches 0 run damage @s 1 minecraft:freeze
execute if score @s temperature.current matches 0 run effect give @s slowness 1 2 true
execute if score @s temperature.current matches 0 run effect give @s mining_fatigue 1 2 true
# Freezing
execute if score _temperature_current_level var matches -2 run effect give @s slowness 1 1 true
execute if score _temperature_current_level var matches -2 run effect give @s mining_fatigue 1 1 true
# Cold
execute if score _temperature_current_level var matches -1 run effect give @s slowness 1 0 true
execute if score _temperature_current_level var matches -1 run effect give @s mining_fatigue 1 0 true

# Hot
execute if score _temperature_current_level var matches 1 run effect give @s hunger 1 0 true
# Very Hot
execute if score _temperature_current_level var matches 2 run effect give @s slowness 1 1 true
execute if score _temperature_current_level var matches 2 run effect give @s hunger 1 2 true
# Heat Stroke - take damage every other second
execute if score _game_time_mod_40 var matches 0 if score @s temperature.current = _globals temperature.max run damage @s 1 minecraft:dry_out


# Apply other adverse environmental effects
# Being wet slows you down
execute if score @s wetness.current > _globals wetness.wetThreshold run effect give @s slowness 1 0 true
execute if score @s wetness.current > _globals wetness.wetThreshold run particle falling_water ~ ~1 ~ 0.3 0.5 0.3 10 1 normal

# Poisonous water in swamps
execute if score _game_time_mod_5 var matches 0 if predicate questcraft:is_in_poisonous_water_biome if predicate questcraft:is_in_water run scoreboard players set _is_in_poison_water var 1
execute if score _game_time_mod_5 var matches 0 if score _is_in_poison_water var matches 1 run effect give @s poison 5 0
execute if score _game_time_mod_40 var matches 0 if score _is_in_poison_water var matches 1 run title @s actionbar [{"bold":true,"italic":true,"color":"#B3FF00","text":"💀 Poisonous Water 💀"}]

scoreboard players reset _temperature_current_level var
scoreboard players reset _is_exposed_to_sky var
scoreboard players reset _is_precipitating var
scoreboard players reset _is_in_water var
scoreboard players reset _is_in_rainy_biome var
scoreboard players reset _is_snowing var
scoreboard players reset _is_day_temperature var
scoreboard players reset _is_night_temperature var
scoreboard players reset _is_in_poison_water var