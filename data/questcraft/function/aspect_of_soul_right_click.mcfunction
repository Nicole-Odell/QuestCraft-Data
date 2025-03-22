# Display the particle unless we have passed the max charge. This avoids particles after a spell is cast if they continue to hold right click.
# execute unless score @s soul_aspect.charge >= _globals spellCastingMaxCharge at @s anchored eyes run particle minecraft:soul_fire_flame ^-0.4 ^0.05 ^0.35 0.025 0.025 0.025 0.01 10 force @s
execute unless score @s soul_aspect.charge matches 5.. at @s anchored eyes run particle minecraft:glow ^-0.4 ^0.05 ^0.35 0 0.05 0 2 5 force @s

# Play the charge up sound if we have started charging
execute if score @s soul_aspect.charge matches 1 run playsound minecraft:block.bell.resonate player @a ~ ~ ~ 1 2 0

# Increase the charge by 1
scoreboard players add @s soul_aspect.charge 1
advancement revoke @s only questcraft:aspect_of_soul_right_click