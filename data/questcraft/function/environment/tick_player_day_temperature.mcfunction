# If in the lava layer, it's always hot
execute if predicate questcraft:is_in_lava_layer run function questcraft:environment/in_hot

# is_frozen is cold during the day, but freezing during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment/in_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if predicate questcraft:is_in_frozen_biome run function questcraft:environment/in_cold
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 1 if predicate questcraft:is_in_frozen_biome run function questcraft:environment/in_freezing

# is_cold is neutral during the day, but cold during snow if exposed to sky
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_snowing var matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_cold run function questcraft:environment/in_cold

# is_desert depends on if you are in shade during the day, or if it is raining (since the sky darkens, it implies that it is cooler)
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_precipitating var matches 1 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment/in_hot
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment/in_burning
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_desert run function questcraft:environment/in_hot

# is_hot depends on if you are in shade during the day
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 1 if biome ~ ~ ~ #questcraft:is_hot run function questcraft:environment/in_hot
execute unless score @s temperature.wasEvaluatedThisTick matches 1 if score _is_exposed_to_sky var matches 0 if biome ~ ~ ~ #questcraft:is_hot run function questcraft:environment/in_neutral

execute unless score @s temperature.wasEvaluatedThisTick matches 1 if biome ~ ~ ~ #questcraft:is_burning run function questcraft:environment/in_burning