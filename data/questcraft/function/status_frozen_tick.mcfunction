scoreboard players remove @s frozenTime 1

execute at @s run particle dust_color_transition{from_color:[1.000,1.000,1.000],scale:2,to_color:[0.000,1.000,1.000]} ~ ~1 ~ 0.35 0.5 0.35 0.2 1 normal
# execute at @s run particle block{block_state:"minecraft:frosted_ice"} ~ ~1 ~ 0.35 0.5 0.35 0.2 3 normal
effect give @s minecraft:slowness 1 5 true
execute if score _game_time_mod_20 var matches 0 run damage @s 1 minecraft:freeze

execute if score @s frozenTime matches 0 run tag @s remove status_frozen