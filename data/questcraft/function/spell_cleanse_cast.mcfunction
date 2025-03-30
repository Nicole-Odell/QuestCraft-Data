execute at @s run playsound minecraft:block.note_block.chime player @a ~ ~1 ~ 1 1.5 0
execute at @s run playsound minecraft:block.note_block.chime player @a ~ ~1 ~ 1 2 0

execute at @s run particle instant_effect ~ ~1 ~ 0.1 0.5 0.1 0.2 40 normal

# Reset base MC effects
effect clear @s

# Reset custom status effects
tag @s remove status_frozen
scoreboard players set @s frozenTime 0

# Reset Cooling Aura state
tag @s remove cooling_aura
scoreboard players set @s coolingAuraTime 0

# Reset Ward state
tag @s remove ward_active
scoreboard players set @s wardTime 0

# Reset levitation state to prevent the scheduled function from applying slow falling later
tag @s remove spell_levitating

# Cancel Bumble Dry
tag @s remove bumble_dry
scoreboard players set @s bumbleDryTime 0