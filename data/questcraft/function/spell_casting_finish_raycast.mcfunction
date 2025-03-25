# Call the actual spell cast function
$function $(spellFunction) with storage questcraft:args

# Call the normal finish function
function questcraft:spell_casting_finish with storage questcraft:args

# Reset the saved spell details
$data remove storage questcraft:mage_data mages[$(mageId)].spellDetails

# We must reset these here because the caller returns
scoreboard players reset _is_spell_cast_with_raycast var
scoreboard players reset _cast_source var