# Mark the entity as blood bonded, and as blood boned to the specific mage
tag @s add blood_bonded
$tag @s add blood_bonded_$(mageId)
$scoreboard players set @s bloodBond.bondedMageId $(mageId)

# Set the time for the entity to be blood bonded
scoreboard players set @s bloodBond.timeRemaining 6000

# Play the particle effect for applying
execute at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:2,to_color:[0.0,0.0,0.0]} ~ ~1 ~ 0.35 0.6 0.35 0.5 80 force

# Force a recalculation of the blood bond power this tick
function questcraft:mage_calculate_blood_bond_power with storage questcraft:args