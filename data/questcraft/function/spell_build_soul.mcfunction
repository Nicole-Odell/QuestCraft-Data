tellraw @s {"bold":false,"color":"aqua","text":"Spell - Soul Aspect added"}

execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
data modify storage questcraft:args aspect set value 2
function questcraft:spell_build_add_aspect with storage questcraft:args
data remove storage questcraft:args id
data remove storage questcraft:args aspect