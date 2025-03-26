execute if score _found_player var matches 1 run return 1
execute as @s at @s run function questcraft:spell_bloodbond_tick_raycast_effects with storage questcraft:args

execute if score _found_player var matches 1 unless score @s bloodBond.castedToThisTick matches 1 as @s facing entity @s feet positioned ~ ~1 ~ positioned ^ ^ ^2 run function questcraft:raycast with storage questcraft:args
execute if score _found_player var matches 1 run scoreboard players set @s bloodBond.castedToThisTick 1