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

# Get the time of day
execute store result score _day_time var run time query daytime

# Main tick functions
execute unless score _globals disableTick matches 1 run function questcraft:sleep_tick
execute unless score _globals disableTick matches 1 run function questcraft:environment_tick
execute unless score _globals disableTick matches 1 run function questcraft:spells_tick
execute unless score _globals disableTick matches 1 run function questcraft:status_effects_tick
execute unless score _globals disableTick matches 1 run function questcraft:projectile_tick
execute unless score _globals disableTick matches 1 run function questcraft:raycast_tick

# Handling for reset if a player dies
execute unless score _globals disableTick matches 1 run execute as @a[scores={health=0}] run function questcraft:player_died

# TEMP
execute if score _game_time_mod_10 var matches 0 as @a at @s as @n[type=villager,tag=!villager_init,distance=..32] run function questcraft:init_villager

# execute as InfectedGrowth at @s run function questcraft:test_raycast
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
scoreboard players reset _day_time var