# If in the lava layer, it's always hot
execute if predicate questcraft:is_in_lava_layer run function questcraft:environment_player_hot

# is_frozen is freezing during the night, but critical freezing during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_freezing
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_freezing
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 1 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_critical_freezing

# is_cold is cold at night, but freezing during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 0 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment_player_freezing

# is_desert is cold at night
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment_player_cold

# is_hot is neutral during the night

execute unless score @s temperature.wasEvaluatedThisTick matches 1 if biome ~ ~ ~ #questcraft:is_burning run function questcraft:environment_player_burning