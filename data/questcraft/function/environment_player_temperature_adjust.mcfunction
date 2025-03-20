# Reset to the midpoint on death
execute if score @s health matches 0 run scoreboard players operation @s temperature.current = _globals temperature.midpoint

# Don't change anything if we are in neutral temperature and are already at the midpoint
execute if score @s temperature.current = _globals temperature.midpoint if score @s temperature.environmentCurrent matches 0 run return 1

# Determine how much to change the meter based on the distance between the environment temperature level and where we are in the meter
# Formula is environment temp level - current temp level, plus 1 more in the direction of the delta
scoreboard players operation _temperature_delta var = @s temperature.environmentCurrent
scoreboard players operation _temperature_delta var -= _temperature_current_level var

# Determine if we are exactly at a threshold
scoreboard players set _at_exact_threshold var 0
execute if score @s temperature.current matches 0 run scoreboard players set _at_exact_threshold var 1
execute if score @s temperature.current = _globals temperature.freezingThreshold run scoreboard players set _at_exact_threshold var 1
execute if score @s temperature.current = _globals temperature.coldThreshold run scoreboard players set _at_exact_threshold var 1
execute if score @s temperature.current = _globals temperature.hotThreshold run scoreboard players set _at_exact_threshold var 1
execute if score @s temperature.current = _globals temperature.overheatingThreshold run scoreboard players set _at_exact_threshold var 1
execute if score @s temperature.current = _globals temperature.max run scoreboard players set _at_exact_threshold var 1

# Add the bonus in the direction of the delta
execute if score _temperature_delta var matches ..-1 run scoreboard players remove _temperature_delta var 1
execute if score _temperature_delta var matches 1.. run scoreboard players add _temperature_delta var 1

# Handle the case where we are in the same level as the environment. If we are exactly at a threshold, we don't need to move at all.
# Otherwise, move it by one in the direction that the environment is
execute if score _temperature_delta var matches 0 if score _at_exact_threshold var matches 0 if score @s temperature.environmentCurrent matches ..-1 run scoreboard players set _temperature_delta var -1
execute if score _temperature_delta var matches 0 if score _at_exact_threshold var matches 0 if score @s temperature.environmentCurrent matches 1.. run scoreboard players set _temperature_delta var 1

# Handle the 0,0 case. Just move it by 1 towards the midpoint
execute if score _temperature_delta var matches 0 if score @s temperature.environmentCurrent matches 0 if score @s temperature.current < _globals temperature.midpoint run scoreboard players set _temperature_delta var 1
execute if score _temperature_delta var matches 0 if score @s temperature.environmentCurrent matches 0 if score @s temperature.current > _globals temperature.midpoint run scoreboard players set _temperature_delta var -1

# Apply the changeSpeed scalar and apply the temperature delta. 
scoreboard players operation _temperature_delta var *= _globals temperature.changeSpeed
scoreboard players operation @s temperature.current += _temperature_delta var

# Reset to the exact middle if we got offset somehow
scoreboard players operation _middle_offset_positive var = _globals temperature.midpoint
scoreboard players operation _middle_offset_positive var += _globals temperature.changeSpeed
scoreboard players operation _middle_offset_negative var = _globals temperature.midpoint
scoreboard players operation _middle_offset_negative var -= _globals temperature.changeSpeed
execute if score @s temperature.current > _middle_offset_negative var if score @s temperature.current < _middle_offset_positive var run scoreboard players operation @s temperature.current = _globals temperature.midpoint

# Clamp the value between 0 and the max
execute if score @s temperature.current matches ..-1 run scoreboard players set @s temperature.current 0
execute if score @s temperature.current > _globals temperature.max run scoreboard players operation @s temperature.current = _globals temperature.max

scoreboard players reset _temperature_delta var
scoreboard players reset _at_exact_threshold var
scoreboard players reset _middle_offset_positive
scoreboard players reset _middle_offset_negative