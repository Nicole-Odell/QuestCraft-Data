# Remove hit tags from all enemies
$tag @s remove zealous_charge_hit_$(playerId)

# Remove the tag for the target
$tag @s remove zealous_charge_target_$(playerId)
effect clear @s glowing
effect clear @s slowness