scoreboard players add @s projectileTimeAlive 1
execute if score @s projectileTimeAlive matches 60.. run kill @s

# Move the particle
tp @s ^ ^ ^6

# Base particle effect
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^ 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^-1 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^-2 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^-2 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^-4 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle portal ^ ^ ^-5 0 0 0 1 30 force
# particle portal ^ ^ ^-6 0 0 0 1 30 force
# particle portal ^ ^ ^-7 0 0 0 1 30 force

execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^ 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^-1 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^-2 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^-2 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^-4 0 0 0 1 30 force
execute if score @s projectileTimeAlive matches 2.. run particle electric_spark ^ ^ ^-5 0 0 0 1 30 force

execute if score @s projectileTimeAlive matches ..1 run summon firework_rocket ^ ^ ^2 {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,has_trail:false,colors:[I;16775633],fade_colors:[I;10879175]}]}}}}
execute if score @s projectileTimeAlive matches ..3 run playsound minecraft:entity.firework_rocket.twinkle player @a ~ ~ ~ 32 1.1 0
execute if score @s projectileTimeAlive matches ..3 run playsound minecraft:entity.firework_rocket.twinkle_far player @a ~ ~ ~ 32 1.1 0
execute if score @s projectileTimeAlive matches ..3 run playsound minecraft:block.bell.resonate player @a ~ ~ ~ 32 2 0