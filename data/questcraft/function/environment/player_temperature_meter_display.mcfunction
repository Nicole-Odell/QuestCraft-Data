execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId
execute store result storage questcraft:args temperatureMax int 1 run scoreboard players get _globals temperature.max
execute store result storage questcraft:args temperatureCurrent int 1 run scoreboard players get @s temperature.current

# Determine if we should show cooling aura indication
execute unless entity @s[tag=cooling_aura] run data modify storage questcraft:args temperatureCoolingTextLeft set value ""
execute unless entity @s[tag=cooling_aura] run data modify storage questcraft:args temperatureCoolingTextRight set value ""
execute if entity @s[tag=cooling_aura] run data modify storage questcraft:args temperatureCoolingTextLeft set value "🌫 "
execute if entity @s[tag=cooling_aura] run data modify storage questcraft:args temperatureCoolingTextRight set value " 🌫"

# Determine if we should show fire indication
execute if score @s isNearWarmth matches 0 run data modify storage questcraft:args temperatureFireTextLeft set value ""
execute if score @s isNearWarmth matches 0 run data modify storage questcraft:args temperatureFireTextRight set value ""
execute if score @s isNearWarmth matches 1.. run data modify storage questcraft:args temperatureFireTextLeft set value "🔥 "
execute if score @s isNearWarmth matches 1.. run data modify storage questcraft:args temperatureFireTextRight set value " 🔥"

# Get the color and text of the environment temperature indication
execute if score @s temperature.environmentCurrent matches 2 run data modify storage questcraft:args temperatureEnvironmentText set value "Very Hot"
execute if score @s temperature.environmentCurrent matches 2 run data modify storage questcraft:args temperatureEnvironmentColor set value "red"
execute if score @s temperature.environmentCurrent matches 1 run data modify storage questcraft:args temperatureEnvironmentText set value "Hot"
execute if score @s temperature.environmentCurrent matches 1 run data modify storage questcraft:args temperatureEnvironmentColor set value "gold"
execute if score @s temperature.environmentCurrent matches 0 run data modify storage questcraft:args temperatureEnvironmentText set value "Comfortable"
execute if score @s temperature.environmentCurrent matches 0 run data modify storage questcraft:args temperatureEnvironmentColor set value "green"
execute if score @s temperature.environmentCurrent matches -1 run data modify storage questcraft:args temperatureEnvironmentText set value "Cold"
execute if score @s temperature.environmentCurrent matches -1 run data modify storage questcraft:args temperatureEnvironmentColor set value "blue"
execute if score @s temperature.environmentCurrent matches -2 run data modify storage questcraft:args temperatureEnvironmentText set value "Freezing"
execute if score @s temperature.environmentCurrent matches -2 run data modify storage questcraft:args temperatureEnvironmentColor set value "aqua"
execute if score @s temperature.environmentCurrent matches -3 run data modify storage questcraft:args temperatureEnvironmentText set value "Glacial"
execute if score @s temperature.environmentCurrent matches -3 run data modify storage questcraft:args temperatureEnvironmentColor set value "white"

# Determine if we should show a wetness indication
execute if score @s wetness.current matches 0 run data modify storage questcraft:args temperatureWetnessText set value ""
execute if score @s wetness.current matches 1.. if score @s wetness.current <= _globals wetness.wetThreshold run data modify storage questcraft:args temperatureWetnessText set value "  Damp"
execute if score @s wetness.current > _globals wetness.wetThreshold if score @s wetness.current <= _globals wetness.drenchedThreshold run data modify storage questcraft:args temperatureWetnessText set value "  💧Wet💧"
execute if score @s wetness.current > _globals wetness.drenchedThreshold run data modify storage questcraft:args temperatureWetnessText set value "  💧💧Drenched💧💧"

# Determine if we should show a hydration indication
execute if score @s hydration.current matches 0 run data modify storage questcraft:args hydrationText set value ""
execute if score @s hydration.current matches 0 run data modify storage questcraft:args hydrationEmptyText set value ""
# If hot, always show the empty meter as a hint
execute if score @s hydration.current matches 0 if score @s temperature.environmentCurrent matches 1.. run data modify storage questcraft:args hydrationEmptyText set value "💧💧💧💧💧  "

# Get the percentage that the player's hydration is of being full
scoreboard players operation _hydration_percentage var = @s hydration.current
scoreboard players set _c_100 var 100
scoreboard players operation _hydration_percentage var *= _c_100 var
scoreboard players operation _hydration_percentage var /= _globals hydration.max

# Set the text
execute if score _hydration_percentage var matches 1..20 run data modify storage questcraft:args hydrationText set value "💧"
execute if score _hydration_percentage var matches 1..20 run data modify storage questcraft:args hydrationEmptyText set value "💧💧💧💧  "

execute if score _hydration_percentage var matches 21..40 run data modify storage questcraft:args hydrationText set value "💧💧"
execute if score _hydration_percentage var matches 21..40 run data modify storage questcraft:args hydrationEmptyText set value "💧💧💧  "

execute if score _hydration_percentage var matches 41..60 run data modify storage questcraft:args hydrationText set value "💧💧💧"
execute if score _hydration_percentage var matches 41..60 run data modify storage questcraft:args hydrationEmptyText set value "💧💧  "

execute if score _hydration_percentage var matches 61..80 run data modify storage questcraft:args hydrationText set value "💧💧💧💧"
execute if score _hydration_percentage var matches 61..80 run data modify storage questcraft:args hydrationEmptyText set value "💧  "

execute if score _hydration_percentage var matches 81.. run data modify storage questcraft:args hydrationText set value "💧💧💧💧💧"
execute if score _hydration_percentage var matches 81.. run data modify storage questcraft:args hydrationEmptyText set value "  "

# Determine the color of the bassbar to use based on the value
execute if score @s temperature.current < _globals temperature.freezingThreshold run data modify storage questcraft:args temperatureMeterColor set value "white"
execute if score @s temperature.current >= _globals temperature.freezingThreshold if score @s temperature.current < _globals temperature.coldThreshold run data modify storage questcraft:args temperatureMeterColor set value "blue"
execute if score @s temperature.current >= _globals temperature.coldThreshold if score @s temperature.current < _globals temperature.hotThreshold run data modify storage questcraft:args temperatureMeterColor set value "green"
execute if score @s temperature.current >= _globals temperature.hotThreshold if score @s temperature.current <= _globals temperature.overheatingThreshold run data modify storage questcraft:args temperatureMeterColor set value "yellow"
execute if score @s temperature.current > _globals temperature.overheatingThreshold run data modify storage questcraft:args temperatureMeterColor set value "red"

# Hide the bossbar if the temperature is at neutral and wetness is at 0
data modify storage questcraft:args temperatureMeterVisible set value "false"
execute unless score @s temperature.current = _globals temperature.midpoint run data modify storage questcraft:args temperatureMeterVisible set value "true"
execute unless score @s wetness.current matches 0 run data modify storage questcraft:args temperatureMeterVisible set value "true"

# If the player is freezing to death and below half health, apply the hypothermic fake heat effect
execute if score @s temperature.current matches 0 if score @s health matches 1..9 run function questcraft:environment/player_temperature_meter_display_fake_hot

# Update the temperature meter display
function questcraft:environment/player_temperature_meter_display_apply with storage questcraft:args

data remove storage questcraft:args playerId
data remove storage questcraft:args temperatureMax
data remove storage questcraft:args temperatureCurrent
data remove storage questcraft:args temperatureCoolingTextLeft
data remove storage questcraft:args temperatureCoolingTextRight
data remove storage questcraft:args temperatureFireTextLeft
data remove storage questcraft:args temperatureFireTextRight
data remove storage questcraft:args temperatureEnvironmentText
data remove storage questcraft:args temperatureEnvironmentColor
data remove storage questcraft:args temperatureWetnessText
data remove storage questcraft:args hydrationText
data remove storage questcraft:args hydrationEmptyText
data remove storage questcraft:args temperatureMeterColor
data remove storage questcraft:args temperatureMeterVisible

scoreboard players reset _c_100
scoreboard players reset _hydration_percentage