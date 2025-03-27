# Check that we confirmed using the same aspect as we cast, otherwise it constitutes a cancel
# Get the original castSource as a score
$execute store result score _original_cast_source var run data get storage questcraft:mage_data mages[$(mageId)].spellDetails.castSource

# Cancel the spell cast if they don't match
execute unless score _original_cast_source var = _cast_source var run function questcraft:spell_casting_cancel with storage questcraft:args

# If they do match, call the raycast confirm function and then the normal finish function
execute if score _original_cast_source var = _cast_source var run function questcraft:spell_casting_finish_raycast_sub with storage questcraft:args

# We must reset these here because the caller returns
scoreboard players reset _is_spell_cast_with_raycast var
scoreboard players reset _original_cast_source var
scoreboard players reset _cast_source var