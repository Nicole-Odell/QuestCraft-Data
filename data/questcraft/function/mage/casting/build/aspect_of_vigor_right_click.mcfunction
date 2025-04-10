# Display the particle unless we have passed the max charge. This avoids particles after a spell is cast if they continue to hold right click.
execute unless score @s vigor_aspect.charge matches 5.. at @s anchored eyes run particle minecraft:composter ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 1 10 force @s

# Play the charge up sound if we have started charging, unless this is just for confirming a raycasted spell
execute unless score @s isCastingPrimed matches 1 if score @s vigor_aspect.charge matches 5 run playsound minecraft:entity.illusioner.prepare_blindness player @a ~ ~1 ~ 0.5 2 0

# Increase the charge by 1
scoreboard players add @s vigor_aspect.charge 1

advancement revoke @s only questcraft:aspect_of_vigor_right_click