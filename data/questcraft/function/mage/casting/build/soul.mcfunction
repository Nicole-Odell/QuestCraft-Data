execute at @s run playsound minecraft:entity.allay.item_thrown player @a ~ ~ ~ 1 0 0
execute at @s run playsound minecraft:entity.wither.shoot player @a ~ ~ ~ 0.3 2 0

execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 2
function questcraft:mage/casting/build/add_aspect with storage questcraft:args

data remove storage questcraft:args mageId
data remove storage questcraft:args aspect