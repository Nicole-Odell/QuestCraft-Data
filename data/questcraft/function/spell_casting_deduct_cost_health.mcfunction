execute store result storage questcraft:args healthCost int 1 run scoreboard players get _spell_cost_with_source var
function questcraft:spell_casting_deduct_cost_health_apply with storage questcraft:args
data remove storage questcraft:args healthCost