# execute at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:block.amethyst_cluster.step player @a ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:entity.witch.drink player @a ~ ~ ~ 0.5 2 0
# execute at @s run playsound minecraft:entity.villager.work_cleric player @a ~ ~ ~ 0.25 2 0

execute at @s run particle minecraft:heart ^ ^1 ^0.25 0.3 0.5 0.3 0.5 5 force @a

effect give @s minecraft:instant_health 1 1