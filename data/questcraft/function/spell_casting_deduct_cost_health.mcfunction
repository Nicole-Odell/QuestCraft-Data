# Take the cost from blood bonded mobs first, if there are any
execute if score @s bloodBondPower matches 1.. run function questcraft:spell_casting_deduct_cost_health_bond with storage questcraft:args

# Force a recalculation of the blood bond power this tick
function questcraft:mage_calculate_blood_bond_power with storage questcraft:args

# No need to hurt the player if the cost was covered by blood bonded mobs
execute if score _spell_cost_with_source var matches 0 run return 1

execute store result storage questcraft:args healthCost int 1 run scoreboard players get _spell_cost_with_source var
function questcraft:spell_casting_deduct_cost_health_apply with storage questcraft:args
data remove storage questcraft:args healthCost