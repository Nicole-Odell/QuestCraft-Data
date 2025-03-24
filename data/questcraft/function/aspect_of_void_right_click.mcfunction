# Display the particle unless we have passed the max charge. This avoids particles after a spell is cast if they continue to hold right click.
# execute unless score @s void_aspect.charge >= @s spellCastingCastCharge at @s anchored eyes run particle minecraft:reverse_portal ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 0.5 10 force @s
# execute unless score @s void_aspect.charge >= @s spellCastingCastCharge at @s anchored eyes run particle minecraft:portal ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 0.5 10 force @s
execute unless score @s void_aspect.charge matches 5.. at @s anchored eyes run particle minecraft:reverse_portal ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 0.5 10 force @s
execute unless score @s void_aspect.charge matches 5.. at @s anchored eyes run particle minecraft:portal ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 0.5 10 force @s

# Play the charge up sound if we have started charging
execute if score @s void_aspect.charge matches 1 run playsound minecraft:block.bell.resonate player @a ~ ~ ~ 1 2 0

# Increase the charge by 1
scoreboard players add @s void_aspect.charge 1

advancement revoke @s only questcraft:aspect_of_void_right_click