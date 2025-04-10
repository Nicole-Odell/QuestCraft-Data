# Implementation of TTL functionality for projectiles
execute as @e[tag=projectile_ttl] run scoreboard players remove @s projectileTtl 1
execute as @e[tag=projectile_ttl,scores={projectileTtl=..0}] at @s run particle minecraft:white_smoke ~ ~ ~ 0.15 0.15 0.15 0.05 10 normal
execute as @e[tag=projectile_ttl,scores={projectileTtl=..0}] run kill @s