# Remove tags
tag @s remove blood_bonded
$tag @s remove blood_bonded_$(mageId)
tag @s remove blood_bonded_hit

say Blood Bond Broke!

# Reset scores 
scoreboard players reset @s bloodBond.timeRemaining
scoreboard players reset @s bloodBond.bondedMageId
scoreboard players reset @s bloodBond.castedToThisTick

# Clean if the entity was set to Red team by the spell
execute if entity @s[team=Red] run team leave @s

# Reset data passed to this function since the caller returns
data remove storage questcraft:args mageId

# Force a recalculation of the blood bond power this tick
function questcraft:mage_calculate_blood_bond_power with storage questcraft:args