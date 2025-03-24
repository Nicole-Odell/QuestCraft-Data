# Move the particle
tp @s ^ ^ ^0.75

# Base particle effect
particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:2,to_color:[0.000,1.000,1.000]} ~ ~ ~ 0.75 0.75 0.75 0.1 10 force
execute at @s run playsound minecraft:entity.breeze.idle_air player @a ~ ~ ~ 0.25 2 0

# Apply Freezing status to all entities it touches
tag @e[type=#questcraft:is_attack_targetable,distance=..3] add status_frozen
scoreboard players set @e[type=#questcraft:is_attack_targetable,distance=..3] frozenTime 200

# Freeze water. Use Frosted Ice in non-frozen biomes
execute unless predicate questcraft:is_in_frozen_biome run fill ^-1 ^-1 ^-1 ^1 ^1 ^1 frosted_ice replace water
execute unless predicate questcraft:is_in_frozen_biome run fill ^-1 ^-1 ^-1 ^1 ^1 ^1 frosted_ice replace frosted_ice[age=1]
execute unless predicate questcraft:is_in_frozen_biome run fill ^-1 ^-1 ^-1 ^1 ^1 ^1 frosted_ice replace frosted_ice[age=2]
execute unless predicate questcraft:is_in_frozen_biome run fill ^-1 ^-1 ^-1 ^1 ^1 ^1 frosted_ice replace frosted_ice[age=3]
execute if predicate questcraft:is_in_frozen_biome run fill ^-1 ^-1 ^-1 ^1 ^1 ^1 ice replace water

# kill it if it hits anything solid. Apply Freezing status in a larger area
execute unless block ~ ~ ~ #questcraft:is_not_solid_for_spells run function questcraft:spell_icewind_projectile_impact