execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

execute store result storage questcraft:args zealCurrent int 1 run scoreboard players get @s zeal.current
execute store result storage questcraft:args zealMax int 1 run scoreboard players get @s zeal.max

execute if score @s zeal.current matches 0 run data modify storage questcraft:args zealMeterVisible set value "false"
execute if score @s zeal.current matches 1.. run data modify storage questcraft:args zealMeterVisible set value "true"

function questcraft:templar_zeal_meter_display_apply with storage questcraft:args

data remove storage questcraft:args playerId
data remove storage questcraft:args zealMax
data remove storage questcraft:args zealCurrent
data remove storage questcraft:args zealMeterVisible