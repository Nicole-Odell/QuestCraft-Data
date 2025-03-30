scoreboard players remove @s wardTime 1

# This will be the last tick of ward being active if the time has run out
execute if score @s wardTime matches ..0 run tag @s remove ward_active

# Particle effects 
execute if score @s wardTime matches 5.. run particle electric_spark ~-1 ~1 ~ 0 0.6 0.5 0 3
execute if score @s wardTime matches 5.. run particle electric_spark ~1 ~1 ~ 0 0.6 0.5 0 3
execute if score @s wardTime matches 5.. run particle electric_spark ~ ~1 ~-1 0.5 0.6 0 0 3
execute if score @s wardTime matches 5.. run particle electric_spark ~ ~1 ~1 0.5 0.6 0 0 3
execute if score @s wardTime matches 5.. run particle electric_spark ~ ~2 ~ 0.6 0 0.6 0 3
execute if score @s wardTime matches 5.. run particle electric_spark ~ ~ ~ 0.6 0 0.6 0 3

# Different effects when running out
execute if score @s wardTime matches ..100 run particle white_ash ~-1 ~1 ~ 0 0.6 0.5 0 3
execute if score @s wardTime matches ..100 run particle white_ash ~1 ~1 ~ 0 0.6 0.5 0 3
execute if score @s wardTime matches ..100 run particle white_ash ~ ~1 ~-1 0.5 0.6 0 0 3
execute if score @s wardTime matches ..100 run particle white_ash ~ ~1 ~1 0.5 0.6 0 0 3
execute if score @s wardTime matches ..100 run particle white_ash ~ ~2 ~ 0.6 0 0.6 0 3
execute if score @s wardTime matches ..100 run particle white_ash ~ ~ ~ 0.6 0 0.6 0 3

# Block incoming projectiles
execute as @e[type=#questcraft:ward_deflectable,tag=!ward_deflected,tag=!player_projectile,distance=..3] run function questcraft:projectile_deflect
execute as @e[type=#questcraft:ward_deflectable,tag=!ward_deflected,tag=!player_projectile,distance=..3] run tag @s add ward_deflected
