say target raycast

# Save the spell name and function for later casting
$data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.spellName set value "$(spellName)"
$data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.spellFunction set value "$(spellFunction)"

# Mark the player as casting a raycast targetted spell
scoreboard players set @s isCastingPrimed 1

# Set the color and cast text based on the aspect it was casted with
$execute if score _cast_source var matches 0 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castAspectName set value "Vigor"
$execute if score _cast_source var matches 0 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castColor set value "green"

$execute if score _cast_source var matches 1 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castAspectName set value "Blood"
$execute if score _cast_source var matches 1 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castColor set value "red"

$execute if score _cast_source var matches 2 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castAspectName set value "Soul"
$execute if score _cast_source var matches 2 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castColor set value "aqua"

$execute if score _cast_source var matches 3 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castAspectName set value "Void"
$execute if score _cast_source var matches 3 run data modify storage questcraft:mage_data mages[$(mageId)].spellDetails.castColor set value "dark_purple"

# Show the casting message
$function questcraft:spell_casting_target_raycast_display with storage questcraft:mage_data mages[$(mageId)].spellDetails