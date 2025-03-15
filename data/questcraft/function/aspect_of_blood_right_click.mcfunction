# Display the particle unless we have passed the max charge. This avoids particles after a spell is cast if they continue to hold right click.
execute unless score @s blood_aspect.charge >= _globals spellCastingMaxCharge at @s anchored eyes run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1,to_color:[0.0,0.0,0.0]} ^-0.4 ^-0.15 ^0.35 0.025 0.025 0.025 1 10 force @s

# Play the charge up sound if we have started charging
execute if score @s blood_aspect.charge matches 1 run playsound minecraft:block.bell.resonate player @a ~ ~ ~ 1 2 0

# Increase the charge by 1
scoreboard players add @s blood_aspect.charge 1

advancement revoke @s only questcraft:aspect_of_blood_right_click