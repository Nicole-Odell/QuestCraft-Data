# Remove the ready state for holding right click
tag @s remove templar_right_click_hold_ready

# Cancel if the cooldown hasn't reached 0, or if we don't have enough zeal for the ability
execute if score @s templar.abilityCooldown matches 1.. run return fail
execute unless score @s zeal.current >= _globals templar.holdClickAbilityCost run return fail

# Re-calculate the amount of damage we should do to targets.
function questcraft:templar/calculate_sword_damage

# The impact function will set this to a nonzero amount if we hit something
scoreboard players set _templar_ability_succeeded var 0

execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

data modify storage questcraft:args rayCastRange set value 16
data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_players"
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastEntityTargettableFilter set value "type=#questcraft:is_attack_targetable"
data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
execute if score @s templar.altClickAbility matches 0 run data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:templar/ability/zealous_charge/cast"
execute if score @s templar.altClickAbility matches 1 run data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:templar/ability/hand_of_gods/cast"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function questcraft:raycasting/start with storage questcraft:args

data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction

# If we did damage, subtract the cost for the ability, if applicable at this stage
execute if score _templar_ability_succeeded var matches 1 if score @s templar.altClickAbility matches 1 run scoreboard players operation @s zeal.current -= _globals templar.holdClickAbilityCost
# Also reset the cooldown until Zeal starts to reduce.
execute if score _templar_ability_succeeded var matches 1 run scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce
# Put abilities on cooldown
execute if score _templar_ability_succeeded var matches 1 run scoreboard players operation @s templar.abilityCooldown = _globals templar.abilityCooldown
# Set the zealous charge duration
execute if score _templar_ability_succeeded var matches 1 if score @s templar.altClickAbility matches 0 run scoreboard players set @s zealousChargeTime 10

scoreboard players reset _templar_ability_succeeded var

data remove storage questcraft:args playerId