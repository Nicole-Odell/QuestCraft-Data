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
$data modify storage questcraft:args rayCastEntityImpactFunction set from storage questcraft:mage_data mages[$(mageId)].spellDetails.spellEntityTargetFunction
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

scoreboard players reset _custom_target_filter_length var