# If the player was already found, we are done
execute if score _found_player var matches 1 run return 1

# Otherwise, recurse
execute as @s at @s run function questcraft:mage/spell/bloodbond/tick_raycast_effects with storage questcraft:args

# If the recursive search finished, and we found a plaayer, raycast back to the caller to link the path that was found
execute if score _found_player var matches 1 unless score @s bloodBond.castedToThisTick matches 1 if entity @s[type=!#questcraft:short_entities,type=!#questcraft:tiny_entities] as @s facing entity @s feet positioned ~ ~1 ~ positioned ^ ^ ^2 run function questcraft:raycasting/start with storage questcraft:args
execute if score _found_player var matches 1 unless score @s bloodBond.castedToThisTick matches 1 if entity @s[type=#questcraft:short_entities] as @s facing entity @s feet positioned ~ ~0.5 ~ positioned ^ ^ ^2 run function questcraft:raycasting/start with storage questcraft:args
execute if score _found_player var matches 1 unless score @s bloodBond.castedToThisTick matches 1 if entity @s[type=#questcraft:tiny_entities] as @s facing entity @s feet positioned ~ ~0.25 ~ positioned ^ ^ ^2 run function questcraft:raycasting/start with storage questcraft:args

# If we are near the edge of the bond range, tp us towards the linked mob to help maintain the link
# execute if score _found_player var matches 1 unless score @s bloodBond.castedToThisTick matches 1 as @s facing entity @s[distance=12..16] feet at @s if block ^ ^ ^-0.5 #questcraft:is_not_solid_for_spells run tp ^ ^ ^-0.1

# Mark that we have already been casted to this tick, for efficiency
execute if score _found_player var matches 1 run scoreboard players set @s bloodBond.castedToThisTick 1