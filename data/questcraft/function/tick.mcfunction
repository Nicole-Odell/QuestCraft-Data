execute if score _globals disableTick matches 1 run return 1

# Get various divisions of ticks to run things less often for performance where desired
execute store result score _game_time_mod_4 var run time query gametime
scoreboard players set _c_4 var 4
scoreboard players operation _game_time_mod_4 var %= _c_4 var

execute store result score _game_time_mod_5 var run time query gametime
scoreboard players set _c_5 var 5
scoreboard players operation _game_time_mod_5 var %= _c_5 var

execute store result score _game_time_mod_10 var run time query gametime
scoreboard players set _c_10 var 10
scoreboard players operation _game_time_mod_10 var %= _c_10 var

execute store result score _game_time_mod_20 var run time query gametime
scoreboard players set _c_20 var 20
scoreboard players operation _game_time_mod_20 var %= _c_20 var

execute store result score _game_time_mod_40 var run time query gametime
scoreboard players set _c_40 var 40
scoreboard players operation _game_time_mod_40 var %= _c_40 var

execute store result score _game_time_mod_100 var run time query gametime
scoreboard players set _c_100 var 100
scoreboard players operation _game_time_mod_100 var %= _c_100 var

# Get the time of day
execute store result score _day_time var run time query daytime

# Main tick functions
function questcraft:items/tick
function questcraft:daily_tick
function questcraft:environment/tick
execute as @a[tag=is_templar] at @s run function questcraft:templar/tick
function questcraft:mage/tick
function questcraft:status_effects/tick
function questcraft:projectile/tick
function questcraft:raycasting/tick
execute as @a[tag=actionbar_no_override] run function questcraft:player/set_actionbar_no_override_tick

function questcraft:mobs/tick

# Reset added/new scores which track delta from last tick
scoreboard players set @a newJumps 0

# Handling for reset if a player dies
execute as @a[scores={health=0}] run function questcraft:player/died

# data modify storage questcraft:args rayCastRange set value 32
# execute as InfectedGrowth at @s run function questcraft:templar/ability/target_raycast_block
# data remove storage questcraft:args rayCastRange
# execute at InfectedGrowth as @n[type=!#questcraft:is_attack_targetable] at @s run function questcraft:debug/test_raycast

scoreboard players reset _c_4 var
scoreboard players reset _game_time_mod_4 var
scoreboard players reset _c_5 var
scoreboard players reset _game_time_mod_5 var
scoreboard players reset _c_10 var
scoreboard players reset _game_time_mod_10 var
scoreboard players reset _c_20 var
scoreboard players reset _game_time_mod_20 var
scoreboard players reset _c_40 var
scoreboard players reset _game_time_mod_40 var
scoreboard players reset _c_100 var
scoreboard players reset _game_time_mod_100 var
scoreboard players reset _day_time var