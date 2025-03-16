# A level of 40 will deduct exactly 1 hunger (1/2 a hunger icon) in the 1 second it will be active for. However 255 is the max level, so we must do more than 1 second for higher values.
# Get the effective level if the max wasn't 255
scoreboard players set _hunger_effective_level_for_cost var 40
scoreboard players operation _hunger_effective_level_for_cost var *= _spell_cost_with_source var
# 240 is the max multiple of 40 that is < 255. We will divide what the level would have been by 240 to get the number of seconds at 240 to remove the right amount.
# The remainder will then tell us the level for the final 1 second of duration.
scoreboard players operation _hunger_duration_at_240 var = _hunger_effective_level_for_cost var
scoreboard players set _c_240 var 240
scoreboard players operation _hunger_duration_at_240 var /= _c_240 var
scoreboard players operation _hunger_remaining_level var = _hunger_effective_level_for_cost var
scoreboard players operation _hunger_remaining_level var %= _c_240 var

# The actual amplifier to pass to the effect command is 1 less than the level. Leave it at 0 if it ends up negative to prevent issues
scoreboard players operation _hunger_remaining_amplifier var = _hunger_remaining_level var
scoreboard players remove _hunger_remaining_amplifier var 1
execute if score _hunger_remaining_amplifier var matches ..0 run scoreboard players set _hunger_remaining_amplifier var 0

# Store the values in args and apply the cost
# Because MC is stupid and can't handle an invalid arg even if a command doesn't get executed, we need to set hungerDurationAt240 to 1 if it would have been 0. Ridiculous.
# spell_casting_deduct_cost_food_apply will ignore the 1 becuase it checks the score instead before running the command
execute if score _hunger_duration_at_240 var matches 0 run data modify storage questcraft:args hungerDurationAt240 set value 1
execute if score _hunger_duration_at_240 var matches 1.. run execute store result storage questcraft:args hungerDurationAt240 int 1 run scoreboard players get _hunger_duration_at_240 var
execute store result storage questcraft:args hungerRemainingAmplifier int 1 run scoreboard players get _hunger_remaining_amplifier var
function questcraft:spell_casting_deduct_cost_food_apply with storage questcraft:args

data remove storage questcraft:args hungerDurationAt240
data remove storage questcraft:args hungerRemainingAmplifier

scoreboard players reset _hunger_effective_level_for_cost var
scoreboard players reset _hunger_duration_at_240 var
scoreboard players reset _hunger_remaining_level var
scoreboard players reset _hunger_remaining_amplifier var
scoreboard players reset _c_240 var