execute at @s run playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 2 1
execute at @s anchored eyes run particle minecraft:firework ^-0.4 ^-0.15 ^0.5 0 0 0 0.2 100 force @s

# Give the player levitation
effect give @s minecraft:levitation 6 1 false

# Set up a function to replace the levitation with slow falling when it ends
tag @s add spell_levitating
schedule function questcraft:spell_levitate_descend 5s