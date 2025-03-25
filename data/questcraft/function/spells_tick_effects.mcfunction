execute as @e[type=arrow,tag=firebolt_fireball] at @s run function questcraft:spell_firebolt_projectile_tick

execute as @e[type=area_effect_cloud,tag=icewind_projectile] at @s run function questcraft:spell_icewind_projectile_tick
function questcraft:spell_icewind_tick

execute as @a[tag=ward_active] at @s run function questcraft:spell_ward_tick

execute as @e[type=area_effect_cloud,tag=hyperbeam_pre_projectile] at @s run function questcraft:spell_hyperbeam_cast_projectile_pre_tick
execute as @e[type=area_effect_cloud,tag=hyperbeam_projectile] at @s run function questcraft:spell_hyperbeam_cast_projectile_tick