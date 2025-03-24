scoreboard players set @s temperature.environmentCurrent 0

function questcraft:debug_print {m:"NEUTRAL"}
function questcraft:debug_print_score {player:"@s",score:"temperature.environmentCurrent"}

# In a cold biome, wet causes cold
execute if score @s wetness.current > _globals wetness.wetThreshold if biome ~ ~ ~ #questcraft:is_cold run scoreboard players set @s temperature.environmentCurrent -1
# If we are in water and the fire is below us (isNearWarmth=2), the water is warm and we are comfortable.
execute if score _is_in_water var matches 1 if score @s isNearWarmth matches 2 run scoreboard players set @s temperature.environmentCurrent 0

function questcraft:debug_print_score {player:"@s",score:"temperature.environmentCurrent"}

# Set the effective environment temp used for hydration and wetness adjustment
scoreboard players set _wetness_effective_temperature_current var 0

# Adjust hydration
function questcraft:environment_player_hydration_adjust

# Nearby warm block increases this value by 1 for wetness
execute if score @s isNearWarmth matches 1.. run scoreboard players add _wetness_effective_temperature_current var 2
execute unless score _is_in_water var matches 1 run function questcraft:environment_player_wetness_adjust

function questcraft:debug_print_var {var:"_wetness_effective_temperature_current"}

function questcraft:environment_player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1

scoreboard players reset _wetness_effective_temperature_current var