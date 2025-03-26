# Take the cost from blood bonded mobs
$execute as @n[type=!player,tag=blood_bonded_$(mageId)] run function questcraft:spell_casting_deduct_cost_health_bond_step with storage questcraft:args
data remove storage questcraft:args healthCost

# Clear the tag that tracks that they were used for a cost
$tag @e[tag=blood_bonded_$(mageId),tag=!blood_bonded_cost_taken] remove blood_bonded_cost_taken