execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

execute store result storage questcraft:args zealCurrent int 1 run scoreboard players get @s zeal.current
# The bar maxes out aat the global max, but Templars can't reach that until a certain level
execute store result storage questcraft:args zealMax int 1 run scoreboard players get @s zeal.max
execute store result storage questcraft:args zealBarMax int 1 run scoreboard players get _globals zeal.max

execute if score @s zeal.current matches 0 run data modify storage questcraft:args zealMeterVisible set value "false"
execute if score @s zeal.current matches 1.. run data modify storage questcraft:args zealMeterVisible set value "true"

# Set the color based on what abilities are available
execute if score @s zeal.currentLevel matches 0..1 run data modify storage questcraft:args zealMeterColor set value "white"
execute if score @s zeal.currentLevel matches 2 run data modify storage questcraft:args zealMeterColor set value "yellow"
execute if score @s zeal.currentLevel matches 3 run data modify storage questcraft:args zealMeterColor set value "red"
execute if score @s zeal.currentLevel matches 4 run data modify storage questcraft:args zealMeterColor set value "blue"

# Show ability markers based on what is available
execute if score @s zeal.currentLevel matches 0..1 run data modify storage questcraft:args zealAbilitiesMarkers set value " "
execute if score @s zeal.currentLevel matches 1 if score @s zeal.current >= _globals templar.altClickAbilityCost run data modify storage questcraft:args zealAbilitiesMarkers set value " ⭐"
execute if score @s zeal.currentLevel matches 2 run data modify storage questcraft:args zealAbilitiesMarkers set value " ⭐⭐"
execute if score @s zeal.currentLevel matches 3 run data modify storage questcraft:args zealAbilitiesMarkers set value " ⭐⭐⭐"
execute if score @s zeal.currentLevel matches 4 run data modify storage questcraft:args zealAbilitiesMarkers set value " ⭐⭐⭐⭐"

# function questcraft:debug/print_score_force {player:"@s",score:"zeal.current"}

function questcraft:templar/zeal_meter_display_apply with storage questcraft:args

data remove storage questcraft:args playerId
data remove storage questcraft:args zealMax
data remove storage questcraft:args zealBarMax
data remove storage questcraft:args zealCurrent
data remove storage questcraft:args zealMeterVisible
data remove storage questcraft:args zealMeterColor
data remove storage questcraft:args zealAbilitiesMarkers