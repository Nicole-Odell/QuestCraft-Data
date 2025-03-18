# Temperatures vary by day and night in some locations
scoreboard players reset * temperature.wasEvaluatedThisTick
scoreboard players set @a temperature.wasEvaluatedThisTick 0

execute as @a at @s run function questcraft:environment_tick_player_base

# Every 5 ticks, check for warm blocks around each player
execute store result score _game_time_mod_5 var run time query daytime
scoreboard players set _c_5 var 5
scoreboard players operation _game_time_mod_5 var %= _c_5 var

execute if score _game_time_mod_5 var matches 0 run execute as @a at @s run function questcraft:environment_detect_warm_block

scoreboard players reset _c_5 var
scoreboard players reset _game_time_mod_5 var