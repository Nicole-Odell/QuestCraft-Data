execute store result storage questcraft:args temperatureCurrent int 1 run scoreboard players get _globals temperature.max
data modify storage questcraft:args temperatureFireTextLeft set value "🔥 "
data modify storage questcraft:args temperatureFireTextRight set value " 🔥"
data modify storage questcraft:args temperatureEnvironmentText set value "Very Hot"
data modify storage questcraft:args temperatureEnvironmentColor set value "red"
data modify storage questcraft:args temperatureWetnessText set value ""
execute if score @s hydration.current matches 0 run data modify storage questcraft:args hydrationEmptyText set value "💧💧💧💧💧  "
data modify storage questcraft:args temperatureMeterColor set value "red"