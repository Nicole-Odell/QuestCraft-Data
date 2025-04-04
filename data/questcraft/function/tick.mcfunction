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
execute unless score _globals disableTick matches 1 run function questcraft:items_tick
execute unless score _globals disableTick matches 1 run function questcraft:sleep_tick
execute unless score _globals disableTick matches 1 run function questcraft:environment_tick
execute unless score _globals disableTick matches 1 run execute as @a[tag=is_templar] at @s run function questcraft:templar_tick
execute unless score _globals disableTick matches 1 run function questcraft:spells_tick
execute unless score _globals disableTick matches 1 run function questcraft:status_effects_tick
execute unless score _globals disableTick matches 1 run function questcraft:projectile_tick
execute unless score _globals disableTick matches 1 run function questcraft:raycast_tick

execute unless score _globals disableTick matches 1 run function questcraft:mobs_tick

# Reset added/new scores which track delta from last tick
scoreboard players set @a newJumps 0

# Handling for reset if a player dies
execute unless score _globals disableTick matches 1 run execute as @a[scores={health=0}] run function questcraft:player_died

# data modify storage questcraft:args rayCastRange set value 32
# execute as InfectedGrowth at @s run function questcraft:templar_ability_target_raycast_block
# data remove storage questcraft:args rayCastRange
# execute at InfectedGrowth as @n[type=!#questcraft:is_attack_targetable] at @s run function questcraft:test_raycast

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