scoreboard players remove @s coolingAuraTime 1

execute if score @s coolingAuraTime matches 400.. run execute at @s run particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:1,to_color:[0.000,1.000,1.000]} ~ ~1 ~ 0.6 0.8 0.6 0.5 2 force
execute if score @s coolingAuraTime matches 40.. run execute at @s run particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:1,to_color:[0.000,1.000,1.000]} ~ ~1 ~ 0.6 0.8 0.6 0.5 1 force
execute at @s run particle white_ash ~0.5 ~1 ~0.5 0.4 0.7 0.4 0 5 force

# The temperature adjust system will handle cooling aura's affect on temperature. We just have to manage the state of the cooling_aura tag.

execute if score @s coolingAuraTime matches ..0 run tag @s remove cooling_aura