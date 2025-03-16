execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
execute store result storage questcraft:args soulPowerMax int 1 run scoreboard players get @s soulPower.max
execute store result storage questcraft:args soulPowerCurrent int 1 run scoreboard players get @s soulPower.current

# Get the percentage that the mage's soul power is of being full
scoreboard players operation _soul_power_percentage var = @s soulPower.current
scoreboard players set _c_100 var 100
scoreboard players operation _soul_power_percentage var *= _c_100 var
scoreboard players operation _soul_power_percentage var /= @s soulPower.max

# Determine the color to use for the text amount based on the percentage
execute if score _soul_power_percentage var matches 100 run data modify storage questcraft:args soulPowerLevelColor set value "aqua"
execute if score _soul_power_percentage var matches 60..99 run data modify storage questcraft:args soulPowerLevelColor set value "white"
execute if score _soul_power_percentage var matches 40..59 run data modify storage questcraft:args soulPowerLevelColor set value "yellow"
execute if score _soul_power_percentage var matches 20..39 run data modify storage questcraft:args soulPowerLevelColor set value "gold"
execute if score _soul_power_percentage var matches 10..19 run data modify storage questcraft:args soulPowerLevelColor set value "red"
execute if score _soul_power_percentage var matches 0..9 run data modify storage questcraft:args soulPowerLevelColor set value "dark_red"

# Determine the color of the bassbar to use based on the percentage
execute if score _soul_power_percentage var matches 20..100 run data modify storage questcraft:args soulPowerMeterColor set value "blue"
execute if score _soul_power_percentage var matches 0..19 run data modify storage questcraft:args soulPowerMeterColor set value "red"

# Update the soul meter display
function questcraft:mage_soul_meter_display_apply with storage questcraft:args

data remove storage questcraft:args id
data remove storage questcraft:args soulPowerMax
data remove storage questcraft:args soulPowerCurrent
data remove storage questcraft:args soulPowerLevelColor
data remove storage questcraft:args soulPowerMeterColor

scoreboard players reset _c_100 var
scoreboard players reset _soul_power_percentage var