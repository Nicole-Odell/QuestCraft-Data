execute if score _raycast_completed var matches 1 run return 1

$function $(rayCastStepFunction) with storage questcraft:args

# Return fail if we hit the range limit
scoreboard players remove _ray_steps_remaining var 1
$execute if score _ray_steps_remaining var matches 0 run function $(rayCastMaxRangeFunction) with storage questcraft:args
execute if score _ray_steps_remaining var matches 0 run return 0

# Run the entity impact function and return success if we hit a target entity
$execute positioned ~ ~-0.5 ~ as @n[$(rayCastEntityTargettableFilter),distance=..$(rayCastEntityImpactRadius)] run return run function $(rayCastEntityImpactFunction) with storage questcraft:args

# Run the block impact function and return success if we hit a block that doesn't match the pass-through filter
$execute unless block ~ ~ ~ $(rayCastBlockPassThroughFilter) run scoreboard players set _ray_hit_block var 1
$execute if score _ray_hit_block var matches 1 positioned ~-0.25 ~-0.25 ~-0.25 run return run function $(rayCastBlockImpactFunction) with storage questcraft:args

# Otherwise, continue stepping the raycast
execute store success score _raycast_completed var positioned ^ ^ ^0.1 run function questcraft:raycast_step with storage questcraft:args