execute at @s run particle minecraft:wax_off ~ ~0.75 ~ 0.1 0.5 0.1 10 60 force
execute at @s run particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:1,to_color:[0.000,1.000,1.000]} ~ ~1 ~ 0.35 0.8 0.35 1 20 force

tag @s add cooling_aura
scoreboard players set @s coolingAuraTime 1250