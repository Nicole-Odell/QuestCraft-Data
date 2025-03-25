say blood bond cast
particle lava ~ ~ ~ 0.5 0.5 0.5 0.1 10

data modify storage questcraft:args rayCastRange set value 32
data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_spells"
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:test_particle_red"
data modify storage questcraft:args rayCastEntityTargettableFilter set value "#questcraft:is_attack_targetable"
data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:test_kill"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

execute as @s at @s positioned ^ ^ ^1 run function questcraft:raycast with storage questcraft:args

data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction