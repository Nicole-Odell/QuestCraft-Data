tellraw @s {"bold":true,"color":"dark_purple","text":"Casted Spell using Void!"}
execute at @s run playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 2 0
execute at @s anchored eyes run particle minecraft:firework ^-0.4 ^-0.15 ^0.5 0 0 0 0.2 100 force @s

# Get the mage id to pass so we can clear the spell buffer
execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
data modify storage questcraft:args castText set value "# Casted using Void # "
data modify storage questcraft:args color set value "dark_purple"
function questcraft:spell_cast_clear_buffer with storage questcraft:args
data remove storage questcraft:args id