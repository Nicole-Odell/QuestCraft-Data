execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId
execute store result storage questcraft:args temperatureMax int 1 run scoreboard players get _globals temperature.max
execute store result storage questcraft:args temperatureCurrent int 1 run scoreboard players get @s temperature.current
execute store result storage questcraft:args temperatureEnvironmentCurrent int 1 run scoreboard players get @s temperature.environmentCurrent

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

# Determine the color of the bassbar to use based on the value
execute if score @s temperature.current < _globals temperature.freezingThreshold run data modify storage questcraft:args temperatureMeterColor set value "white"
execute if score @s temperature.current >= _globals temperature.freezingThreshold if score @s temperature.current < _globals temperature.coldThreshold run data modify storage questcraft:args temperatureMeterColor set value "blue"
execute if score @s temperature.current >= _globals temperature.coldThreshold if score @s temperature.current < _globals temperature.hotThreshold run data modify storage questcraft:args temperatureMeterColor set value "green"
execute if score @s temperature.current >= _globals temperature.hotThreshold if score @s temperature.current <= _globals temperature.overheatingThreshold run data modify storage questcraft:args temperatureMeterColor set value "yellow"
execute if score @s temperature.current > _globals temperature.overheatingThreshold run data modify storage questcraft:args temperatureMeterColor set value "red"

# Hide the bossbar if the temperature is at neutral
data modify storage questcraft:args temperatureMeterVisible set value "true"
execute if score @s temperature.current = _globals temperature.midpoint run data modify storage questcraft:args temperatureMeterVisible set value "false"

# Update the temperature meter display
function questcraft:environment_player_temperature_meter_display_apply with storage questcraft:args

data remove storage questcraft:args playerId
data remove storage questcraft:args temperatureMax
data remove storage questcraft:args temperatureCurrent
data remove storage questcraft:args temperatureEnvironmentCurrent
data remove storage questcraft:args temperatureEnvironmentText
data remove storage questcraft:args temperatureEnvironmentColor
data remove storage questcraft:args temperatureMeterColor
data remove storage questcraft:args temperatureMeterVisible