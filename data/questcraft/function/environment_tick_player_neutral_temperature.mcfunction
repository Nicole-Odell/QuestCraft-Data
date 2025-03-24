# If in the lava layer, it's always hot
execute if predicate questcraft:is_in_lava_layer run function questcraft:environment_player_hot

# is_frozen is cold during the day,but freezing during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 1 if predicate questcraft:is_in_frozen_biome run function questcraft:environment_player_freezing

# is_cold is neutral at sunrise and sunset, but cold during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment_player_cold

# is_desert is neutral at sunrise and sunset

# is_hot is neutral at sunrise and sunset

execute unless score @s temperature.wasEvaluatedThisTick matches 1 if biome ~ ~ ~ #questcraft:is_burning run function questcraft:environment_player_burning