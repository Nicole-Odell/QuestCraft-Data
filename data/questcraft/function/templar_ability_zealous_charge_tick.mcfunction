# Decrement the charge time
scoreboard players remove @s zealousChargeTime 1

# Play particle effect
particle wax_off ~ ~1 ~ 0.3 0.5 0.3 0.5 30

# If we hit the target, deal huge damage to it
$execute positioned ^ ^ ^ as @e[type=#questcraft:is_attack_targetable,tag=zealous_charge_target_$(playerId),distance=..1.5] run function questcraft:templar_ability_zealous_charge_impact with storage questcraft:args

# Damage other enemies we charge
$execute as @e[type=#questcraft:is_attack_targetable,tag=!zealous_charge_target_$(playerId),distance=..2] run damage @s 8 generic
$execute as @e[type=#questcraft:is_attack_targetable,tag=!zealous_charge_target_$(playerId),distance=..2] at @s run playsound minecraft:item.shield.block player @a ~ ~ ~ 1 0 0
$execute as @e[type=#questcraft:is_attack_targetable,tag=!zealous_charge_target_$(playerId),distance=..2] at @s run particle firework ~ ~1 ~ 0.25 0.25 0.25 0.25 20

# Check that we aren't going into a wall
scoreboard players set _is_next_location_solid var 0
execute rotated ~ 0.0 unless block ^ ^ ^2 #questcraft:is_not_solid_for_spells run scoreboard players set _is_next_location_solid var 1
execute rotated ~ 0.0 positioned ^ ^ ^2 unless block ~ ~1 ~ #questcraft:is_not_solid_for_spells run scoreboard players set _is_next_location_solid var 1

# Charge the player forward
execute unless score _is_next_location_solid var matches 1 rotated ~ 0.0 run tp @s ^ ^ ^2

# End the charge if we hit a wall
execute if score _is_next_location_solid var matches 1 run scoreboard players set @s zealousChargeTime 0

$execute if score @s zealousChargeTime matches 0 run execute as @e[type=#questcraft:is_attack_targetable,tag=zealous_charge_target_$(playerId),distance=..128] run function questcraft:templar_ability_zealous_charge_end with storage questcraft:args