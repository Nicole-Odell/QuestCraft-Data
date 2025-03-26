scoreboard players operation _ray_steps_mod_2 var = _ray_steps_remaining var
scoreboard players set _c_2 var 2
scoreboard players operation _ray_steps_mod_2 var %= _c_2 var

execute if score _ray_steps_mod_2 var matches 0 run particle dust_color_transition{from_color:[1.0,0.0,0.0],scale:0.4,to_color:[0.0,0.0,0.0]} ^ ^ ^ 0 0 0 0.1 1 force

scoreboard players reset _ray_steps_mod_2 var
scoreboard players reset _c_2 var