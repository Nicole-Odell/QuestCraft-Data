$scoreboard players set _ray_steps_remaining var $(rayCastRange)

# Enforce the max to be safe
execute if score _ray_steps_remaining var > _globals raycast.maxRange run scoreboard players operation _ray_steps_remaining var = _globals raycast.maxRange

# Multiply by 10 to get the number of 0.1-long raycast steps
scoreboard players set _c_10 var 10
scoreboard players operation _ray_steps_remaining var *= _c_10 var

# Determine if there is actually any custom projectile data to include
execute store result score _block_pass_filter_length var run data get storage questcraft:args rayCastBlockPassThroughFilter

scoreboard players set _ray_hit_block var 0
scoreboard players set _raycast_completed var 0

# Start the raycast
execute unless score _block_pass_filter_length var matches 0 run function questcraft:raycast_step with storage questcraft:args

# If there is no block passthrough filter, call an alternate function that doesn't do block impacts
execute if score _block_pass_filter_length var matches 0 run function questcraft:raycast_step_no_block_impact with storage questcraft:args

execute if score _ray_hit_block var matches 0 run kill @e[type=block_display,tag=raycast_block_display]

scoreboard players reset _ray_steps_remaining var
scoreboard players reset _block_pass_filter_length var
scoreboard players reset _raycast_completed var
scoreboard players reset _ray_hit_block var