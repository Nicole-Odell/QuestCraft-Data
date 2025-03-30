# Get the current temperature as a representation of where in the meter it is
execute if score @s temperature.current < _globals temperature.freezingThreshold run scoreboard players set @s temperature.currentLevel -2
execute if score @s temperature.current >= _globals temperature.freezingThreshold if score @s temperature.current < _globals temperature.coldThreshold run scoreboard players set @s temperature.currentLevel -1
execute if score @s temperature.current >= _globals temperature.coldThreshold if score @s temperature.current < _globals temperature.hotThreshold run scoreboard players set @s temperature.currentLevel 0
execute if score @s temperature.current >= _globals temperature.hotThreshold if score @s temperature.current <= _globals temperature.overheatingThreshold run scoreboard players set @s temperature.currentLevel 1
execute if score @s temperature.current > _globals temperature.overheatingThreshold run scoreboard players set @s temperature.currentLevel 2

execute store success score _is_exposed_to_sky var run execute if predicate questcraft:is_exposed_to_sky
execute store success score _is_precipitating var run execute if predicate questcraft:is_raining
execute store success score _is_thundering var run execute if predicate questcraft:is_thundering
execute store success score _is_in_water var run execute if predicate questcraft:is_in_water
execute store success score _is_in_rainy_biome var run execute if predicate questcraft:is_in_rainy_biome
# _is_snowing will technically also be true in deserts, but we don't check it for those biomes.
# Not being specific here saves us some performance by not having another predicate or check for is_desert
scoreboard players set _is_snowing var 0
execute store success score _is_snowing var run execute if score _is_in_rainy_biome var matches 0 if score _is_precipitating var matches 1

# Apply wetness if the player is in water, or if it is raining and they are exposed to sky in a rainy biome. 
execute if score _is_in_water var matches 1 if score @s wetness.current < _globals wetness.max run scoreboard players operation @s wetness.current += _globals wetness.waterWetSpeed

# Regular Rain cannot reach drenched level. Make sure we don't go past it with rain alone
execute if score _is_precipitating var matches 1 if score _is_in_rainy_biome var matches 1 if score _is_exposed_to_sky var matches 1 if score @s wetness.current <= _globals wetness.drenchedThresholdMinusRainWetSpeed run scoreboard players operation @s wetness.current += _globals wetness.rainWetSpeed

# Apply it (possibly again if not yet drenched) if it is thundering. Thundering can go past drenched level
execute if score _is_thundering var matches 1 if score _is_in_rainy_biome var matches 1 if score _is_exposed_to_sky var matches 1 if score @s wetness.current < _globals wetness.max run scoreboard players operation @s wetness.current += _globals wetness.rainWetSpeed
# Clamp it at the max value
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

# Set this initially since we will modify it based on current temperature level
scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge
scoreboard players set _c_3 var 3
scoreboard players set _c_2 var 2

# Freezing to death
#   Take freezing damage every other second
#   Slowness 3
#   Mining Fatigue 3
#   Mage casting is 3x slower
execute if score _game_time_mod_40 var matches 0 if score @s temperature.current matches 0 run damage @s 1 minecraft:freeze
execute if score @s temperature.current matches 0 run effect give @s slowness 1 2 true
execute if score @s temperature.current matches 0 run effect give @s mining_fatigue 1 2 true
execute if score @s temperature.current matches 0 run scoreboard players operation @s spellCastingRequiredCastCharge *= _c_3 var

# Freezing
#   Slowness 2
#   Mining Fatigue 2
#   Mage casting is 2x slower
execute if score @s temperature.currentLevel matches -2 run effect give @s slowness 1 1 true
execute if score @s temperature.currentLevel matches -2 run effect give @s mining_fatigue 1 1 true
execute if score @s temperature.current matches 0 run scoreboard players operation @s spellCastingRequiredCastCharge *= _c_2 var

# Cold
#   Slowness 1
#   Mining Fatigue 1
#   Mage casting is 1.5x slower
execute if score @s temperature.currentLevel matches -1 run effect give @s slowness 1 0 true
execute if score @s temperature.currentLevel matches -1 run effect give @s mining_fatigue 1 0 true
# We just add 5 to this for perf reasons since we can't multiply by 1.5. Should be updated if the default spellCastingRequiredCastCharge is ever changed
execute if score @s temperature.current matches 0 run scoreboard players add @s spellCastingRequiredCastCharge 6

# Hot
#   Hunger 1
execute if score @s temperature.currentLevel matches 1 run effect give @s hunger 1 0 true
execute if score @s temperature.current matches 0 run scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge

# Very Hot
#   Slowness 2
#   Hunger 3
#   TODO: Zeal depletes 1.5x faster
execute if score @s temperature.currentLevel matches 2 run effect give @s slowness 1 1 true
execute if score @s temperature.currentLevel matches 2 run effect give @s hunger 1 2 true
execute if score @s temperature.current matches 0 run scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge

# Heat Stroke
#   Take dehydration damage every other second
#   TODO: Zeal depletes 2x faster
execute if score _game_time_mod_40 var matches 0 if score @s temperature.current = _globals temperature.max run damage @s 1 minecraft:dry_out
execute if score @s temperature.current matches 0 run scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge

# Apply other adverse environmental effects

# Being drenched slows you down
execute if score @s wetness.current > _globals wetness.drenchedThreshold run effect give @s slowness 1 0 true
execute if score @s wetness.current > _globals wetness.drenchedThreshold run particle falling_water ~ ~1 ~ 0.3 0.5 0.3 10 1 normal

# Poisonous water in swamps
execute if score _game_time_mod_5 var matches 0 if predicate questcraft:is_in_poisonous_water_biome if predicate questcraft:is_in_water run scoreboard players set _is_in_poison_water var 1
execute if score _game_time_mod_5 var matches 0 if score _is_in_poison_water var matches 1 run effect give @s poison 5 0
execute if score _game_time_mod_40 var matches 0 if score _is_in_poison_water var matches 1 run title @s actionbar [{"bold":true,"italic":true,"color":"#B3FF00","text":"💀 Poisonous Water 💀"}]


scoreboard players reset _is_exposed_to_sky var
scoreboard players reset _is_precipitating var
scoreboard players reset _is_thundering var
scoreboard players reset _is_in_water var
scoreboard players reset _is_in_rainy_biome var
scoreboard players reset _is_snowing var
scoreboard players reset _is_day_temperature var
scoreboard players reset _is_night_temperature var
scoreboard players reset _c_3 var
scoreboard players reset _c_2 var
scoreboard players reset _is_in_poison_water var