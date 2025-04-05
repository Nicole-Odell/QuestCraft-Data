# Re-calculate the amount of damage we should do to targets.
function questcraft:templar_calculate_sword_damage

# Set the args that the raycast entity impact function will use for damage
execute store result storage questcraft:args swordDamage int 1 run scoreboard players get @s templar.swordDamage
execute store result storage questcraft:args swordUndeadDamage int 1 run scoreboard players get @s templar.swordUndeadDamage
execute store result storage questcraft:args swordArthropodDamage int 1 run scoreboard players get @s templar.swordArthropodDamage
execute store result storage questcraft:args swordFireTime int 1 run scoreboard players get @s templar.swordFireTime

# The impact function will set this to a nonzero amount if we hit something
scoreboard players set _templar_ability_succeeded var 0

execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

data modify storage questcraft:args rayCastRange set value 48
data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_players"
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:templar_ability_heavenly_strike_impact"
data modify storage questcraft:args rayCastEntityTargettableFilter set value ""
data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function questcraft:raycast with storage questcraft:args

data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction

# If not successful, do nothing and return
execute if score _templar_ability_succeeded var matches 0 run return run scoreboard players reset _templar_ability_succeeded var

# If the raycast was successful, reset the state
tag @s remove templar_crouch_jump_heavenly_strike_ready
scoreboard players set @s templar.isAbilityPrimed 0
scoreboard players set @s heavenlyStrikeFloatTime 0
effect clear @s minecraft:slow_falling
effect clear @s minecraft:levitation

# Subtract the cost of the ability
scoreboard players operation @s zeal.current -= _globals templar.crouchJumpAbilityCost

# Add back half the damage done as Zeal
# Subtract 1 from _templar_ability_succeeded to account for the extra 1 used to ensure we know an impact occurred
scoreboard players remove _templar_ability_succeeded var 1
scoreboard players set _c_2 var 2
scoreboard players operation _templar_ability_succeeded var /= _c_2 var
scoreboard players operation @s zeal.current += _templar_ability_succeeded var


scoreboard players reset _templar_ability_succeeded var
