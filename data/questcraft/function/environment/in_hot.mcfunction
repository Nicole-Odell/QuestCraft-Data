scoreboard players set @s temperature.environmentCurrent 1

function questcraft:debug/print {m:"HOT"}
function questcraft:debug/print_score {player:"@s",score:"temperature.environmentCurrent"}

# If wet we are comfortable
execute if score @s wetness.current matches 1.. run scoreboard players set @s temperature.environmentCurrent 0

# If hydrated we are comfortable
execute if score @s hydration.current matches 1.. run scoreboard players set @s temperature.environmentCurrent 0

function questcraft:debug/print_score {player:"@s",score:"temperature.environmentCurrent"}

# Set the effective environment temp used for hydration and wetness adjustment
scoreboard players set _wetness_effective_temperature_current var 1

# Adjust hydration
function questcraft:environment/player_hydration_adjust

# Nearby warm block increases this value by 1 for wetness
execute if score @s isNearWarmth matches 1.. run scoreboard players add _wetness_effective_temperature_current var 1
execute unless score _is_in_water var matches 1 run function questcraft:environment/player_wetness_adjust

function questcraft:debug/print_var {var:"_wetness_effective_temperature_current"}

function questcraft:environment/player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1

scoreboard players reset _wetness_effective_temperature_current var