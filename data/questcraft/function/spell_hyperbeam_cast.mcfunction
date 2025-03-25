execute at @s anchored eyes rotated as @s run function questcraft:projectile_launch {projectileEntity:"minecraft:area_effect_cloud", projectileSpeed:1, projectileSpeedOffsetLR:0, projectileSpeedOffsetUD:0, projectileTag:"hyperbeam_pre_projectile", projectileData:"Duration:60,", projectileTtl:4}
execute at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=hyperbeam_pre_projectile,distance=..5] ^ ^ ^ ~ ~

execute as @n[type=area_effect_cloud,tag=hyperbeam_pre_projectile,distance=..5] run scoreboard players set @s projectileTimeAlive 0

execute at @s anchored eyes rotated as @s run function questcraft:projectile_launch {projectileEntity:"minecraft:area_effect_cloud", projectileSpeed:1, projectileSpeedOffsetLR:0, projectileSpeedOffsetUD:0, projectileTag:"hyperbeam_projectile", projectileData:"Duration:60,", projectileTtl:4}
execute at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=hyperbeam_projectile,distance=..5] ^ ^ ^ ~ ~

execute as @n[type=area_effect_cloud,tag=hyperbeam_projectile,distance=..5] run scoreboard players set @s projectileTimeAlive 0

