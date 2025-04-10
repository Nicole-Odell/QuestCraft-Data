# Temperatures vary by day and night in some locations
scoreboard players reset * temperature.wasEvaluatedThisTick
scoreboard players set @a temperature.wasEvaluatedThisTick 0

execute as @a at @s run function questcraft:environment/tick_player_base

# Every 5 ticks, check for warm blocks around each player
execute if score _game_time_mod_5 var matches 0 run execute as @a at @s run function questcraft:environment/detect_warm_block