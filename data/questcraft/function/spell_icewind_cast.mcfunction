execute at @s anchored eyes run playsound minecraft:entity.breeze.idle_air player @a ~ ~ ~ 0.5 0 0
execute at @s anchored eyes run playsound minecraft:entity.breeze.idle_ground player @a ~ ~ ~ 0.5 1.8 0
execute at @s anchored eyes run playsound minecraft:block.snow.break player @a ~ ~ ~ 1 2 0

execute at @s anchored eyes rotated as @s run function questcraft:projectile_launch {projectileEntity:"minecraft:area_effect_cloud", projectileSpeed:1, projectileSpeedOffsetLR:0, projectileSpeedOffsetUD:0, projectileTag:"icewind_projectile", projectileData:"Duration:120", projectileTtl:5}
execute at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=icewind_projectile,distance=..2] ^ ^ ^ ~ ~