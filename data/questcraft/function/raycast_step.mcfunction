execute if score _raycast_completed var matches 1 run return 1

# Return fail if we hit the range limit
scoreboard players remove _ray_steps_remaining var 1
$execute if score _ray_steps_remaining var matches 0 run function $(rayCastMaxRangeFunction) with storage questcraft:args
execute if score _ray_steps_remaining var matches 0 run return 0

# Run the entity impact function and return success if we hit a target entity
$execute as @n[type=$(rayCastEntityTargettableFilter),distance=..1.5] at @s run function $(rayCastEntityImpactFunction) with storage questcraft:args
$execute if entity @n[type=$(rayCastEntityTargettableFilter),distance=..1.5] run return 1

# Run the block impact function and return success if we hit a block that doesn't match the pass-through filter
$execute unless block ~ ~ ~ $(rayCastBlockPassThroughFilter) run scoreboard players set _ray_hit_block var 1
$execute if score _ray_hit_block var matches 1 positioned ~-0.25 ~-0.25 ~-0.25 run function $(rayCastBlockImpactFunction) with storage questcraft:args
execute if score _ray_hit_block var matches 1 run return 1

# Otherwise, continue stepping the raycast
$function $(rayCastStepFunction) with storage questcraft:args
execute store success score _raycast_completed var positioned ^ ^ ^0.1 run function questcraft:raycast_step with storage questcraft:args