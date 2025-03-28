execute at @s run playsound minecraft:block.amethyst_cluster.step player @a ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:entity.player.burp player @a ~ ~ ~ 0.5 1.6 0
execute at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.5 1.2 0

execute at @s run particle minecraft:composter ^ ^1 ^0.25 0.5 0.5 0.5 0.5 8 force @a
execute at @s run particle minecraft:totem_of_undying ^ ^1.5 ^0.25 0.5 0.5 0.5 0.1 16 force @a

effect give @s minecraft:saturation 1 7