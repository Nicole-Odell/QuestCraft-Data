execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId

# Get the vigor power
execute store result score _vigor_power var run scoreboard players get @s food
# Account for saturation
execute store result score _food_saturation_power var run data get entity @s foodSaturationLevel
scoreboard players operation _food_saturation_power var *= _globals spellCastingFoodPower
scoreboard players operation _vigor_power var += _food_saturation_power var

# Multiply by how much power 1 vigor represents
scoreboard players operation _vigor_power var *= _globals spellCastingFoodPower
execute store result storage questcraft:args vigorPower int 1 run scoreboard players get _vigor_power var


# Get the blood power
execute store result score _blood_power var run scoreboard players get @s health

# Periodically re-calculate the mage's blood bond power
execute if score _game_time_mod_10 var matches 5 run execute run function questcraft:mage/calculate_blood_bond_power with storage questcraft:args

# Add the blood bond power to the blood power if there is any. Divide it by the divider for blood bond power
execute if score @s bloodBondPower matches 1.. run scoreboard players operation _blood_bond_power var = @s bloodBondPower
execute if score @s bloodBondPower matches 1.. run scoreboard players operation _blood_bond_power var /= _globals spellCastingBloodBondPowerDivider
execute if score @s bloodBondPower matches 1.. run scoreboard players operation _blood_power var += _blood_bond_power var

# Multiply by how much power 1 blood represents
scoreboard players operation _blood_power var *= _globals spellCastingBloodPower
execute if score @s bloodBondPower matches 0 run data modify storage questcraft:args bloodPowerDecorationText set value ""
execute if score @s bloodBondPower matches 1.. run data modify storage questcraft:args bloodPowerDecorationText set value "+"
execute store result storage questcraft:args bloodPower int 1 run scoreboard players get _blood_power var


# Multiply the soul power by how much power 1 soul represents
scoreboard players operation _soul_power var = @s soulPower.current
scoreboard players operation _soul_power var *= _globals spellCastingSoulPower
execute store result storage questcraft:args soulPowerCurrent int 1 run scoreboard players get _soul_power var

# Multiply the soul power max by how much power 1 soul represents
scoreboard players operation _soul_power_max var = @s soulPower.max
scoreboard players operation _soul_power_max var *= _globals spellCastingSoulPower
execute store result storage questcraft:args soulPowerMax int 1 run scoreboard players get _soul_power_max var

# Get the percentage that the mage's soul power is of being full
scoreboard players operation _soul_power_percentage var = @s soulPower.current
scoreboard players set _c_100 var 100
scoreboard players operation _soul_power_percentage var *= _c_100 var
scoreboard players operation _soul_power_percentage var /= @s soulPower.max

# Determine the color to use for the soul text amount based on the percentage of soul power
execute if score _soul_power_percentage var matches 100 run data modify storage questcraft:args soulPowerLevelColor set value "aqua"
execute if score _soul_power_percentage var matches 60..99 run data modify storage questcraft:args soulPowerLevelColor set value "white"
execute if score _soul_power_percentage var matches 40..59 run data modify storage questcraft:args soulPowerLevelColor set value "yellow"
execute if score _soul_power_percentage var matches 20..39 run data modify storage questcraft:args soulPowerLevelColor set value "gold"
execute if score _soul_power_percentage var matches 10..19 run data modify storage questcraft:args soulPowerLevelColor set value "red"
execute if score _soul_power_percentage var matches 0..9 run data modify storage questcraft:args soulPowerLevelColor set value "dark_red"

# Determine the color of the bassbar to use based on the percentage of soul power
execute if score _soul_power_percentage var matches 20..100 run data modify storage questcraft:args soulPowerMeterColor set value "blue"
execute if score _soul_power_percentage var matches 0..19 run data modify storage questcraft:args soulPowerMeterColor set value "red"


# Update the soul meter display
function questcraft:mage/soul_meter_display_apply with storage questcraft:args

data remove storage questcraft:args mageId
data remove storage questcraft:args soulPowerMax
data remove storage questcraft:args soulPowerCurrent
data remove storage questcraft:args vigorPower
data remove storage questcraft:args bloodPower
data remove storage questcraft:args bloodPowerDecorationText
data remove storage questcraft:args soulPowerLevelColor
data remove storage questcraft:args soulPowerMeterColor

scoreboard players reset _vigor_power
scoreboard players reset _blood_power
scoreboard players reset _blood_bond_power
scoreboard players reset _soul_power
scoreboard players reset _soul_power_max
scoreboard players reset _food_saturation_power
scoreboard players reset _c_100 var
scoreboard players reset _soul_power_percentage var