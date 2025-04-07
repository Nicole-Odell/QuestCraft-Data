execute at @s run playsound entity.player.levelup hostile @a ~ ~1 ~ 0.9 1.9 0
execute at @s run playsound entity.breeze.death hostile @a ~ ~1 ~ 1 2 0
execute at @s run particle glow ~ ~1 ~ 0.25 0.5 0.25 0 45 normal
execute at @s run function questcraft:tp_to_loc {x:"~",y:-10,z:"~"}
kill @s