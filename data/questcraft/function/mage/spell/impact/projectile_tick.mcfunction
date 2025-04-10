# Base particle effect and sound
particle dust_color_transition{from_color:[0.867,1.000,0.212],scale:0.5,to_color:[0.400,1.000,0.000]} ~ ~ ~ 0 0 0 0.3 4 force
execute positioned ^ ^ ^1 run particle dust_color_transition{from_color:[0.867,1.000,0.212],scale:0.5,to_color:[0.400,1.000,0.000]} ~ ~ ~ 0 0 0 0.3 4 force
execute positioned ^ ^ ^2 run particle dust_color_transition{from_color:[0.867,1.000,0.212],scale:0.5,to_color:[0.400,1.000,0.000]} ~ ~ ~ 0 0 0 0.3 4 force
execute at @s run playsound minecraft:entity.breeze.slide player @a ~ ~ ~ 0.25 0 0

# Explode if we hit a mob
# Do this for spaces ahead of us in case we will skip over an entity. Track whether we already handled it
scoreboard players set _impact_impact_done var 0
execute positioned ^ ^ ^-2 if entity @n[type=#questcraft:is_attack_targetable,distance=..1.5] run function questcraft:mage/spell/impact/projectile_impact_entity
execute unless score _impact_impact_done var matches 1 positioned ^ ^ ^-1 if entity @n[type=#questcraft:is_attack_targetable,distance=..1.5] run function questcraft:mage/spell/impact/projectile_impact_entity
execute unless score _impact_impact_done var matches 1 positioned ^ ^ ^ if entity @n[type=#questcraft:is_attack_targetable,distance=..1.5] run function questcraft:mage/spell/impact/projectile_impact_entity

# Explode if it hits anything solid
# Do this for spaces ahead of us in case we will skip over a block. Track whether we already handled it
execute unless score _impact_impact_done var matches 1 positioned ^ ^ ^2 unless block ~ ~ ~ #questcraft:is_not_solid_for_spells run function questcraft:mage/spell/impact/projectile_impact_block
execute unless score _impact_impact_done var matches 1 positioned ^ ^ ^1 unless block ~ ~ ~ #questcraft:is_not_solid_for_spells run function questcraft:mage/spell/impact/projectile_impact_block
execute unless score _impact_impact_done var matches 1 positioned ^ ^ ^ unless block ~ ~ ~ #questcraft:is_not_solid_for_spells run function questcraft:mage/spell/impact/projectile_impact_block
scoreboard players reset _impact_impact_done var

# Move the particle
tp @s ^ ^ ^3