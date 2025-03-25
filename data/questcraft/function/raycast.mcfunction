$scoreboard players set _ray_steps_remaining var $(rayCastRange)

# Enforce the max to be safe
execute if score _ray_steps_remaining var > _globals raycast.maxRange run scoreboard players operation _ray_steps_remaining var = _globals raycast.maxRange

# Multiply by 10 to get the number of 0.1-long raycast steps
scoreboard players set _c_10 var 10
scoreboard players operation _ray_steps_remaining var *= _c_10 var

scoreboard players set _ray_hit_block var 0
scoreboard players set _raycast_completed var 0

execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function questcraft:raycast_step with storage questcraft:args

execute if score _ray_hit_block var matches 0 run kill @e[type=block_display,tag=raycast_block_display]

scoreboard players reset _ray_steps_remaining var
scoreboard players reset _raycast_completed var
scoreboard players reset _ray_hit_block var