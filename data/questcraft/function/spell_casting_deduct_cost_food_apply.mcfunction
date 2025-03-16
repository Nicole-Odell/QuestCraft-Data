# Apply the duration at level 240 (amplifier 239)
effect clear @s minecraft:hunger
$execute if score _hunger_duration_at_240 var matches 1.. run effect give @s minecraft:hunger $(hungerDurationAt240) 239

# If there was no duration at 240, apply the remainder amplifier now instead of scheduling it
$execute if score _hunger_duration_at_240 var matches 0 run effect give @s minecraft:hunger 1 $(hungerRemainingAmplifier)

# If we applied a duration at 240, and there is a remainder amplifier, we need to tag the player and schedule them to have the next amplifier applied after the duration at 240 ends
$execute if score _hunger_duration_at_240 var matches 1.. if score _hunger_remaining_amplifier var matches 1.. run tag @s add food_cost_scheduled_$(hungerRemainingAmplifier)
$execute if score _hunger_duration_at_240 var matches 1.. if score _hunger_remaining_amplifier var matches 1.. run schedule function questcraft:spell_casting_deduct_cost_food_apply_scheduled $(hungerDurationAt240)s append