# If we get here and we have already been casted to this tick, we are done
execute if score @s bloodBond.castedToThisTick matches 1 run scoreboard players set _found_player var 1
execute if score @s bloodBond.castedToThisTick matches 1 run return 1

# Mark that we have been searched in this recursion
tag @s add blood_bonded_hit
# Temporarily remove this tag so we don't search ourself
$tag @s remove blood_bonded_$(mageId)

# Debug tracking for recursion steps
scoreboard players add _rec_checks var 1

# If we have found the player, raycast to them and we are done. The recursion will complete up the stack now
$execute if entity @p[tag=blood_bonded_$(mageId),distance=..16] run scoreboard players set _found_player var 1
# $execute if score _found_player var matches 1 as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=..16] feet positioned ~ ~1 ~ run function questcraft:raycast with storage questcraft:args
$execute if score _found_player var matches 1 if entity @s[type=!#questcraft:short_entities,type=!#questcraft:tiny_entities] as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=..16] feet positioned ~ ~1 ~ run function questcraft:raycast with storage questcraft:args
$execute if score _found_player var matches 1 if entity @s[type=#questcraft:short_entities] as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=..16] feet positioned ~ ~0.5 ~ run function questcraft:raycast with storage questcraft:args
$execute if score _found_player var matches 1 if entity @s[type=#questcraft:tiny_entities] as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=..16] feet positioned ~ ~0.25 ~ run function questcraft:raycast with storage questcraft:args

# If we are near the edge of the bond range, tp us towards the player to help maintain the link
# $execute if score _found_player var matches 1 as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=12..16] feet if block ^ ^ ^0.5 #questcraft:is_not_solid_for_spells run tp ^ ^ ^0.1

# If we didn't find the player, recursively search all bonded mobs in range
$execute if score _found_player var matches 0 as @e[tag=blood_bonded_$(mageId),tag=!blood_bonded_hit,distance=..16] run function questcraft:spell_bloodbond_tick_raycast_effects_sub with storage questcraft:args

# Reset tags so that we are searchable again
$tag @s add blood_bonded_$(mageId)
tag @s remove blood_bonded_hit