execute at @s run particle minecraft:wax_on ~ ~0.75 ~ 0.1 0.4 0.1 10 60 force
execute at @s run particle minecraft:small_flame ~ ~1 ~ 0.5 0.5 0.5 0 30 force

# Divide the max temperature by 6 to get the amount that 1 temperature level represents
scoreboard players operation _one_temperature_level var = _globals temperature.max
scoreboard players set _c_6 var 6
scoreboard players operation _one_temperature_level var /= _c_6 var

# Add the amount to the player's temperature
scoreboard players operation @s temperature.current += _one_temperature_level var

scoreboard players reset _one_temperature_level var
scoreboard players reset _c_6 var