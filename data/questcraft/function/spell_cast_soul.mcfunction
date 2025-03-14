tellraw @s {"bold":true,"color":"aqua","text":"Casted Spell using Soul!"}
execute at @s run playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 2 0
execute at @s anchored eyes run particle minecraft:firework ^-0.4 ^-0.15 ^0.5 0 0 0 0.2 100 force @s