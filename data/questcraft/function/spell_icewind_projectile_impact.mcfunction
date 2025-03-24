tag @e[type=#questcraft:is_attack_targetable,distance=..5] add status_frozen
scoreboard players set @e[type=#questcraft:is_attack_targetable,distance=..5] frozenTime 300
execute at @s anchored eyes run playsound minecraft:entity.breeze.idle_ground player @a ~ ~ ~ 0.5 1.8 0
execute at @s anchored eyes run playsound minecraft:block.snow.break player @a ~ ~ ~ 1 2 0
particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:2,to_color:[0.000,1.000,1.000]} ~ ~ ~ 2 2 2 0.1 100 force
kill @s