# Determine the amount to damage the entity and reduce the remaining cost by. Start with the remaining cost
scoreboard players operation _cost_for_entity var = _spell_cost_with_source var
# execute store result storage questcraft:args healthCost int 1 run scoreboard players get _spell_cost_with_source var

# Get the health of the bonded entity
execute store result score _bonded_entity_health var run data get entity @s Health 1

# If the bonded entity's health is less than the remaining amount, we just use their current health
execute if score _bonded_entity_health var <= _spell_cost_with_source var run scoreboard players operation _cost_for_entity var = _bonded_entity_health var
# Otherwise, we will use up the remaining cost
execute if score _bonded_entity_health var > _spell_cost_with_source var run scoreboard players operation _cost_for_entity var = _spell_cost_with_source var

# Reduce the remaining cost by the determined amount
scoreboard players operation _spell_cost_with_source var -= _cost_for_entity var

# Apply the determined amount of damage to the entity
execute store result storage questcraft:args healthCost int 1 run scoreboard players get _cost_for_entity var
function questcraft:spell_casting_deduct_cost_health_apply with storage questcraft:args

# Mark that we have applied the cost to this entity this tick
tag @s add blood_bonded_cost_taken

# Reset before the potential return
scoreboard players reset _bonded_entity_health
scoreboard players reset _cost_for_entity

# We are done if we have accounted for all of the cost
execute if score _spell_cost_with_source var matches 0 run return 1

# Otherwise, find the next entity
$execute as @n[type=!player,tag=blood_bonded_$(mageId),tag=!blood_bonded_cost_taken] run function questcraft:spell_casting_deduct_cost_health_bond_step with storage questcraft:args
