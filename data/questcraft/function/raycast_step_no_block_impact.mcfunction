execute if score _raycast_completed var matches 1 run return 1

$function $(rayCastStepFunction) with storage questcraft:args

# Return fail if we hit the range limit
scoreboard players remove _ray_steps_remaining var 1
$execute if score _ray_steps_remaining var matches 0 run function $(rayCastMaxRangeFunction) with storage questcraft:args
execute if score _ray_steps_remaining var matches 0 run return 0

# Run the entity impact function and return success if we hit a target entity
$execute positioned ~ ~-0.5 ~ as @n[$(rayCastEntityTargettableFilter),distance=..$(rayCastEntityImpactRadius)] at @s run function $(rayCastEntityImpactFunction) with storage questcraft:args
$execute positioned ~ ~-0.5 ~ if entity @n[$(rayCastEntityTargettableFilter),distance=..$(rayCastEntityImpactRadius)] run return 1

# Otherwise, continue stepping the raycast
execute store success score _raycast_completed var positioned ^ ^ ^0.1 run function questcraft:raycast_step_no_block_impact with storage questcraft:args