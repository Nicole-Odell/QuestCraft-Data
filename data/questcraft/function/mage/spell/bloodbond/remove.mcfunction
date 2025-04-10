# Remove tags
tag @s remove blood_bonded
$tag @s remove blood_bonded_$(mageId)
tag @s remove blood_bonded_hit

$execute as @s run tellraw @p[tag=blood_bonded_$(mageId)] {"color":"red","italic":true,"text":"Blood Bond Broke!"}
$execute as @p[tag=blood_bonded_$(mageId)] at @s run playsound minecraft:entity.witch.drink player @s ~ ~ ~ 0.7 0.7 0
$execute as @p[tag=blood_bonded_$(mageId)] at @s run playsound minecraft:block.glass.break player @s ~ ~ ~ 0.7 1.8 0
execute at @s run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:1.5,to_color:[0.0,0.0,0.0]} ~ ~1 ~ 0.35 0.6 0.35 2 25 force

# Reset scores 
scoreboard players reset @s bloodBond.timeRemaining
scoreboard players reset @s bloodBond.bondedMageId
scoreboard players reset @s bloodBond.castedToThisTick

# Clean if the entity was set to Red team by the spell
execute if entity @s[team=Red] run team leave @s

# Reset data passed to this function since the caller returns
data remove storage questcraft:args mageId

# Force a recalculation of the blood bond power this tick
function questcraft:mage/calculate_blood_bond_power with storage questcraft:args