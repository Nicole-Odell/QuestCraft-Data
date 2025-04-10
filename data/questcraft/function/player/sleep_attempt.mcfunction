advancement revoke @s only questcraft:sleep_attempted

# Don't let the sleep message be overridden by anything
function questcraft:player/set_actionbar_no_override

# Don't bother if sleep isn't even possible normally
execute unless predicate questcraft:is_sleep_possible run return 1

# Dissallow sleep if the player is not at temperature midpoint and dry
scoreboard players set _cant_sleep var 0
execute unless score @s temperature.environmentCurrent matches 0 run scoreboard players set _cant_sleep var 1
execute unless score @s temperature.currentLevel matches 0 run scoreboard players set _cant_sleep var 1
execute unless score @s wetness.current matches 0 run scoreboard players set _cant_sleep var 1

execute if score _cant_sleep var matches 1 run title @s actionbar [{"italic":true,"color":"yellow","text":"You must be dry and at a neutral temperature to sleep!"}]
# tp ~ ~ ~ cancels sleep
execute if score _cant_sleep var matches 1 at @s run tp @s ~ ~ ~

scoreboard players reset _cant_sleep var