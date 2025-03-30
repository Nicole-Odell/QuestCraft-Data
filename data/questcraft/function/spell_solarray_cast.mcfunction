execute at @s run playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 2 0 0
execute at @s run playsound minecraft:block.beacon.ambient player @a ~ ~ ~ 1 2 0

execute at @s run particle trial_spawner_detection ~ ~1 ~ 6 0.5 6 0.5 200 force

execute at @s as @e[type=#minecraft:undead,distance=..12] at @s run function questcraft:spell_solarray_cast_sub