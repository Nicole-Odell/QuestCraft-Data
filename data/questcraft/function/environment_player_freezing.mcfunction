scoreboard players set @s temperature.environmentCurrent -2

execute store success score _is_in_shelter var run execute if predicate questcraft:is_in_shelter

function questcraft:debug_print {m:"FREEZING"}

function questcraft:debug_print_score {player:"@s",score:"temperature.environmentCurrent"}

# Any wetness causes critical freezing
execute if score _is_in_shelter var matches 0 if score @s wetness.current matches 1.. run scoreboard players set @s temperature.environmentCurrent -3

# When by a fire, wet causes freezing until dried off
execute if score _is_in_shelter var matches 0 if score @s isNearWarmth matches 1 run scoreboard players set @s temperature.environmentCurrent 0
execute if score _is_in_shelter var matches 0 if score @s isNearWarmth matches 1 if score @s wetness.current > _globals wetness.wetThreshold run scoreboard players set @s temperature.environmentCurrent -2

# In shelter, wet causes cold until dried off
execute if score _is_in_shelter var matches 1 run scoreboard players set @s temperature.environmentCurrent 0
execute if score _is_in_shelter var matches 1 if score @s wetness.current > _globals wetness.wetThreshold run scoreboard players set @s temperature.environmentCurrent -1

function questcraft:debug_print_score {player:"@s",score:"temperature.environmentCurrent"}

# Adjust hydration. In cold areas, hydration doesn't decrease differently then neutral 
scoreboard players set _wetness_effective_temperature_current var 0
function questcraft:environment_player_hydration_adjust

# Set the effective environment temp used for wetness adjustment
execute if score _is_in_shelter var matches 0 run scoreboard players set _wetness_effective_temperature_current var -2
execute if score _is_in_shelter var matches 1 run scoreboard players set _wetness_effective_temperature_current var 0
# Nearby warm block increases this value by 2
execute if score @s isNearWarmth matches 1 run scoreboard players add _wetness_effective_temperature_current var 3
execute unless score _is_in_water var matches 1 run function questcraft:environment_player_wetness_adjust

function questcraft:debug_print_var {var:"_wetness_effective_temperature_current"}

function questcraft:environment_player_temperature_adjust

scoreboard players set @a temperature.wasEvaluatedThisTick 1

scoreboard players reset _is_in_shelter var
scoreboard players reset _wetness_effective_temperature_current var