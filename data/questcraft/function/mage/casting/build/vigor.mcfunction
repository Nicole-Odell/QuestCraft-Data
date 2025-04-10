execute at @s run playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.9 0

execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 0
function questcraft:mage/casting/build/add_aspect with storage questcraft:args

data remove storage questcraft:args mageId
data remove storage questcraft:args aspect