data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_players"
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastEntityTargettableFilter set value "type=#questcraft:is_attack_targetable"
data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:raycast_mark_entity"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function questcraft:raycast with storage questcraft:args

data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction