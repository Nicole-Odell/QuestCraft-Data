# Mark the entity as blood bonded, and as blood boned to the specific mage
tag @s add blood_bonded
$tag @s add blood_bonded_$(mageId)
$scoreboard players set @s bloodBond.bondedMageId $(mageId)

# Set the time for the entity to be blood bonded
scoreboard players set @s bloodBond.timeRemaining 6000

# Play the sound effects for applying
$execute as @p[tag=blood_bonded_$(mageId)] at @s run playsound minecraft:entity.witch.drink player @s ~ ~ ~ 0.5 1.2 0
$execute as @p[tag=blood_bonded_$(mageId)] at @s run playsound minecraft:block.note_block.harp player @s ~ ~ ~ 0.5 0 0
$execute as @p[tag=blood_bonded_$(mageId)] at @s run playsound minecraft:block.note_block.chime player @s ~ ~ ~ 0.5 0 0

# Play the particle effect for applying
$execute as @p[tag=blood_bonded_$(mageId)] at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1,to_color:[0.0,0.0,0.0]} ^-0.5 ^ ^0.5 0 0 0 0.5 50 force
execute if entity @s[type=!#questcraft:short_entities,type=!#questcraft:tiny_entities] at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1.5,to_color:[0.0,0.0,0.0]} ~ ~1 ~ 0.35 0.6 0.35 1 65 force
execute if entity @s[type=#questcraft:short_entities] at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1.5,to_color:[0.0,0.0,0.0]} ~ ~0.5 ~ 0.35 0.25 0.35 1 65 force
execute if entity @s[type=#questcraft:tiny_entities] at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1.5,to_color:[0.0,0.0,0.0]} ~ ~0 ~ 0.35 0.125 0.35 1 65 force

# Force a recalculation of the blood bond power this tick
function questcraft:mage_calculate_blood_bond_power with storage questcraft:args

# Mark that we succeeded at marking an entity
scoreboard players set _did_raycast_spell_succeed var 1