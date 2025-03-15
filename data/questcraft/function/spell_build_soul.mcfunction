execute at @s run playsound minecraft:entity.allay.item_thrown player @a ~ ~ ~ 1 0 0
execute at @s run playsound minecraft:entity.wither.shoot player @a ~ ~ ~ 0.3 2 0

execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 2
function questcraft:spell_build_add_aspect with storage questcraft:args

data remove storage questcraft:args id
data remove storage questcraft:args aspect