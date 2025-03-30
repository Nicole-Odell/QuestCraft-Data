particle minecraft:small_gust ~ ~1 ~ 0.5 0.5 0.5 0 5 normal

playsound entity.breeze.whirl player @a ~ ~ ~ 1 2 0

scoreboard players remove @s wetness.current 70

scoreboard players remove @s bumbleDryTime 1

# This will be the last tick of bumble dry being active if the time has run out
execute if score @s bumbleDryTime matches ..0 run tag @s remove bumble_dry