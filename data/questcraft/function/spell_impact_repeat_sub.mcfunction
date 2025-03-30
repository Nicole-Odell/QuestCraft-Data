scoreboard players remove @s impactShotsInBurst 1

execute at @s run playsound minecraft:entity.shulker.shoot player @a ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:block.bell.use player @a ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:entity.breeze.deflect player @a ~ ~ ~ 0.5 0 0

execute store result score _random_spread_val var run random value 0..4

execute at @s anchored eyes run function questcraft:projectile_launch {projectileEntity:"minecraft:area_effect_cloud", projectileSpeed:1, projectileSpeedOffsetLR:0, projectileSpeedOffsetUD:0, projectileTag:"impact_projectile", projectileData:"Duration:100", projectileTtl:6}
execute if score _random_spread_val var matches 4 at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=impact_projectile,distance=..2] ^ ^ ^ ~ ~
execute if score _random_spread_val var matches 0 at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=impact_projectile,distance=..2] ^-0.5 ^ ^ ~ ~
execute if score _random_spread_val var matches 1 at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=impact_projectile,distance=..2] ^0.5 ^ ^ ~ ~
execute if score _random_spread_val var matches 2 at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=impact_projectile,distance=..2] ^ ^-0.4 ^ ~ ~
execute if score _random_spread_val var matches 3 at @s anchored eyes rotated as @s run tp @n[type=area_effect_cloud,tag=impact_projectile,distance=..2] ^ ^0.5 ^ ~ ~

execute if score @s impactShotsInBurst matches 1.. run schedule function questcraft:spell_impact_repeat 3t append

scoreboard players reset _random_spread_val var