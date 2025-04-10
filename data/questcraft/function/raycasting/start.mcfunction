$scoreboard players set _ray_steps_remaining var $(rayCastRange)

# Enforce the max to be safe
execute if score _ray_steps_remaining var > _globals raycast.maxRange run scoreboard players operation _ray_steps_remaining var = _globals raycast.maxRange

# Multiply by 10 to get the number of 0.1-long raycast steps. Add 1 to fix off-by 1 with the first step since we do our subtraction before
scoreboard players set _c_10 var 10
scoreboard players operation _ray_steps_remaining var *= _c_10 var
scoreboard players add _ray_steps_remaining var 1

# Determine if there is actually any block filter
execute store result score _block_pass_filter_length var run data get storage questcraft:args rayCastBlockPassThroughFilter

# Determine if there is actually any block filter
execute store result score _entity_target_filter_length var run data get storage questcraft:args rayCastEntityTargettableFilter

scoreboard players set _ray_hit_block var 0
scoreboard players set _raycast_completed var 0

# Start the raycast
execute unless score _block_pass_filter_length var matches 0 run function questcraft:raycasting/step with storage questcraft:args

# If there is no entity targetting filter, call an alternate function that doesn't do entity impacts
execute if score _entity_target_filter_length var matches 0 run function questcraft:raycasting/step_no_entity_impact with storage questcraft:args

# If there is no block passthrough filter, call an alternate function that doesn't do block impacts
execute if score _block_pass_filter_length var matches 0 run function questcraft:raycasting/step_no_block_impact with storage questcraft:args

execute if score _ray_hit_block var matches 0 run kill @e[type=block_display,tag=raycast_block_display]

scoreboard players reset _ray_steps_remaining var
scoreboard players reset _block_pass_filter_length var
scoreboard players reset _entity_target_filter_length var
scoreboard players reset _raycast_completed var
scoreboard players reset _ray_hit_block var