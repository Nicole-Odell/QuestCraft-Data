tellraw @s {"bold":false,"color":"dark_purple","text":"Spell - Void Aspect added"}

execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 3
function questcraft:spell_build_add_aspect with storage questcraft:args
data remove storage questcraft:args id
data remove storage questcraft:args aspect