$data modify storage questcraft:args rayCastRange set from storage questcraft:mage_data mages[$(mageId)].spellDetails.spellRaycastRange
data modify storage questcraft:args rayCastStepFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value "#questcraft:is_not_solid_for_spells"
$data modify storage questcraft:args rayCastBlockImpactFunction set from storage questcraft:mage_data mages[$(mageId)].spellDetails.spellBlockTargetFunction

# Determine if there is a custom target filter for the spell
$execute store result score _custom_target_filter_length var run data get storage questcraft:mage_data mages[$(mageId)].spellDetails.spellCustomTargetFilter
$execute if score _custom_target_filter_length var matches 1.. run data modify storage questcraft:args rayCastEntityTargettableFilter set from storage questcraft:mage_data mages[$(mageId)].spellDetails.spellCustomTargetFilter
# Otherwise, use the default
execute unless score _custom_target_filter_length var matches 1.. run data modify storage questcraft:args rayCastEntityTargettableFilter set value "type=#questcraft:is_attack_targetable"

data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
$data modify storage questcraft:args rayCastEntityImpactFunction set from storage questcraft:mage_data mages[$(mageId)].spellDetails.spellFunction
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

# The spellFunction called by raycast will set _did_raycast_spell_succeed to 1 if it hit and succeeded
scoreboard players set _did_raycast_spell_succeed var 0
execute as @s at @s anchored eyes positioned ^ ^ ^ anchored feet run function questcraft:raycast with storage questcraft:args

# If it succeeded, actually finish the cast and reset the saved spell details
execute if score _did_raycast_spell_succeed var matches 1 run function questcraft:spell_casting_finish with storage questcraft:args
$execute if score _did_raycast_spell_succeed var matches 1 run data remove storage questcraft:mage_data mages[$(mageId)].spellDetails

data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction

scoreboard players reset _custom_target_filter_length var
scoreboard players reset _did_raycast_spell_succeed var