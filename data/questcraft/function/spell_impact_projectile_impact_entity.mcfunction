execute as @n[type=#questcraft:is_attack_targetable,distance=..2] at @s run particle dust_color_transition{from_color:[0.867,1.000,0.212],scale:1,to_color:[0.000,0.100,0.000]} ~ ~1 ~ 0.3 0.5 0.3 2 75 force
particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 1 50 force

execute as @n[type=#questcraft:is_attack_targetable,distance=..2] run damage @s 8 magic

kill @s
scoreboard players set _impact_impact_done var 1