execute at @s run playsound minecraft:entity.witch.drink player @a ~ ~ ~ 1 1.5 0
execute at @s run playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 1 2 0

execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 1
function questcraft:spell_build_add_aspect with storage questcraft:args

data remove storage questcraft:args mageId
data remove storage questcraft:args aspect