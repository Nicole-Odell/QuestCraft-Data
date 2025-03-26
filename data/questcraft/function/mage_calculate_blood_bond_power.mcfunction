# Sum the health of all blood bonded mobs
scoreboard players set _blood_bond_power var 0
$execute as @e[type=!player,tag=blood_bonded_$(mageId)] run function questcraft:mage_calculate_blood_bond_power_sub

# Update the players blood bond power
scoreboard players operation @s bloodBondPower = _blood_bond_power var

scoreboard players reset _blood_bond_power var