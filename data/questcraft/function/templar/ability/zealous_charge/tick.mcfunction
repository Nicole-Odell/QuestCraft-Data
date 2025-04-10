# Decrement the charge time
scoreboard players remove @s zealousChargeTime 1

# Check that we aren't going into a wall
scoreboard players set _is_next_location_solid var 0
execute rotated ~ 0.0 unless block ^ ^ ^2 #questcraft:is_not_solid_for_players run scoreboard players set _is_next_location_solid var 1
execute rotated ~ 0.0 positioned ^ ^ ^2 unless block ~ ~1 ~ #questcraft:is_not_solid_for_players run scoreboard players set _is_next_location_solid var 1

# Play particle effect
execute unless score _is_next_location_solid var matches 1 rotated ~ 0.0 positioned ^ ^ ^2 run particle wax_off ~ ~1 ~ 0.3 0.5 0.3 0.5 30

# Play the sound effects
execute rotated ~ 0.0 positioned ^ ^ ^2 run playsound entity.breeze.idle_ground player @a ~ ~1 ~ 1 2 0

# The damage functions will add to this if we do damage
scoreboard players set _templar_ability_damage_done var 0

# If we hit the target directly, deal double damage to it. Don't damage mobs tat have already been hit once this charge
$execute positioned ^ ^ ^ as @e[type=#questcraft:is_attack_targetable,tag=!zealous_charge_hit_$(playerId),tag=zealous_charge_target_$(playerId),distance=..1.5] run function questcraft:templar/ability/zealous_charge/impact_target with storage questcraft:args
# Damage other enemies we hit during the charge. Don't damage mobs tat have already been hit once this charge
$execute positioned ^ ^ ^ as @e[type=#questcraft:is_attack_targetable,tag=!zealous_charge_hit_$(playerId),tag=!zealous_charge_target_$(playerId),distance=..2] run function questcraft:templar/ability/zealous_charge/impact with storage questcraft:args

# Add back zeal based on 1/2 of the damage done
scoreboard players set _c_2 var 2
scoreboard players operation _templar_ability_damage_done var /= _c_2 var
scoreboard players operation @s zeal.current += _templar_ability_damage_done var

# Charge the player forward
execute unless score _is_next_location_solid var matches 1 rotated ~ 0.0 run tp @s ^ ^ ^2 ~ 30.0



# End the charge if we hit a wall.
# If we didn't hit a wall, reduce Zeal by the total cost / the max charge time (20 / 10).
# Doing this here means that shorter charges don't waste zeal
execute unless score _is_next_location_solid var matches 1 run scoreboard players remove @s zeal.current 2
execute if score _is_next_location_solid var matches 1 run scoreboard players set @s zealousChargeTime 0

# Give the player invulnerability while charging
execute if score @s zealousChargeTime matches 10.. run effect give @s resistance 1 9 true

# Keep Zeal from reducing while zealous charge is active
scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce

$execute if score @s zealousChargeTime matches 0 run execute as @e[type=#questcraft:is_attack_targetable,tag=zealous_charge_hit_$(playerId),distance=..128] run function questcraft:templar/ability/zealous_charge/end with storage questcraft:args

scoreboard players reset _templar_ability_damage_done var
scoreboard players reset _is_next_location_solid var
