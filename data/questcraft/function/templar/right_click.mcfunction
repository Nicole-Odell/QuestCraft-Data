# Remove the ready state for holding right click
tag @s remove templar_right_click_hold_ready

# Cancel if the cooldown hasn't reached 0, or if we don't have enough zeal for the ability
execute if score @s templar.abilityCooldown matches 1.. run return fail
execute unless score @s zeal.current >= _globals templar.altClickAbilityCost run return fail

# Re-calculate the amount of damage we should do to the target.
function questcraft:templar/calculate_sword_damage

# Set the args that the raycast entity impact function will use for damage
execute store result storage questcraft:args swordDamage int 1 run scoreboard players get @s templar.swordDamage
execute store result storage questcraft:args swordUndeadDamage int 1 run scoreboard players get @s templar.swordUndeadDamage
execute store result storage questcraft:args swordArthropodDamage int 1 run scoreboard players get @s templar.swordArthropodDamage
execute store result storage questcraft:args swordFireTime int 1 run scoreboard players get @s templar.swordFireTime

# The impact function will set this to a nonzero amount if we hit something
scoreboard players set _templar_ability_succeeded var 0

data modify storage questcraft:args rayCastRange set value 16
data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
# Normally we use is_not_solid_for_players, but since these are ranged attacks, use the spells pass trhough filter
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_spells"
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastEntityTargettableFilter set value "type=#questcraft:is_attack_targetable"
data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
execute if score @s templar.altClickAbility matches 0 run data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:templar/ability/spirit_swipe/cast"
execute if score @s templar.altClickAbility matches 1 run data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:templar/ability/rightous_advent/cast"
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

# If we did damage, subtract the cost for the ability
execute if score _templar_ability_succeeded var matches 1.. run scoreboard players operation @s zeal.current -= _globals templar.altClickAbilityCost
# Also reset the cooldown until Zeal starts to reduce.
execute if score _templar_ability_succeeded var matches 1.. run scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce
# Put abilities on cooldown
execute if score _templar_ability_succeeded var matches 1.. run scoreboard players operation @s templar.abilityCooldown = _globals templar.abilityCooldown 

# For spirit swipe, add back half the damage done as Zeal
scoreboard players set _c_2 var 2
scoreboard players operation _templar_ability_succeeded var /= _c_2 var
execute if score @s templar.altClickAbility matches 0 run scoreboard players operation @s zeal.current += _templar_ability_succeeded var

scoreboard players reset _templar_ability_succeeded var
scoreboard players reset _c_2 var

data remove storage questcraft:args swordDamage
data remove storage questcraft:args swordUndeadDamage
data remove storage questcraft:args swordArthropodDamage
data remove storage questcraft:args swordFireTime