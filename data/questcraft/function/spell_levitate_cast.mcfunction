execute at @s run playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 2 1
execute at @s anchored feet run particle minecraft:firework ~ ~ ~ 0 0 0 0.2 100 force @a

# Give the player levitation
effect give @s minecraft:levitation 12 0 false

# Set up a function to replace the levitation with slow falling when it ends
tag @s add spell_levitating
schedule function questcraft:spell_levitate_descend 12s