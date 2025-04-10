# Decrement the blood bond remaining time
scoreboard players remove @s bloodBond.timeRemaining 1

# If the time remaining has reached 0, remove the blood bond
execute if score @s bloodBond.timeRemaining matches 0 run execute store result storage questcraft:args mageId int 1 run scoreboard players get @s bloodBond.bondedMageId
execute if score @s bloodBond.timeRemaining matches 0 run function questcraft:mage/spell/bloodbond/remove with storage questcraft:args
execute if score @s bloodBond.timeRemaining matches 0 run return 1

# Play the base particle effect
execute if entity @s[type=!#questcraft:short_entities,type=!#questcraft:tiny_entities] run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1,to_color:[0.0,0.0,0.0]} ~ ~1 ~ 0.25 0.25 0.25 0.1 10 force
execute if entity @s[type=#questcraft:short_entities] run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1,to_color:[0.0,0.0,0.0]} ~ ~0.5 ~ 0.15 0.15 0.15 0.1 8 force
execute if entity @s[type=#questcraft:tiny_entities] run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1,to_color:[0.0,0.0,0.0]} ~ ~0.25 ~ 0.1 0.1 0.1 0.1 6 force

# Each entity will try to raycast a path back to the player
# Don't bother if we were already used in a path this tick
execute if score @s bloodBond.castedToThisTick matches 1 run return 1

# Get the mageId into argument storage for the below function
execute store result storage questcraft:args mageId int 1 run scoreboard players get @s bloodBond.bondedMageId

data modify storage questcraft:args rayCastRange set value 16
data modify storage questcraft:args rayCastStepFunction set value "questcraft:mage/spell/bloodbond/raycast_effects"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value ""
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:nop"
# This just sets rayCastEntityTargettableFilterusing the mageId
function questcraft:mage/spell/bloodbond/tick_sub with storage questcraft:args
data modify storage questcraft:args rayCastEntityImpactRadius set value "1"
data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:mage/spell/bloodbond/raycast_effects_impact"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

scoreboard players set _found_player var 0
scoreboard players set _rec_checks var 0
function questcraft:mage/spell/bloodbond/tick_raycast_effects with storage questcraft:args

# If the player wasn't recursively reached, break the blood bond
execute if score _found_player var matches 0 run function questcraft:mage/spell/bloodbond/remove with storage questcraft:args

scoreboard players reset _rec_checks var
scoreboard players reset _found_player var

data remove storage questcraft:args mageId
data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction