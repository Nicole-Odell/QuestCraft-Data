# Wait to start the actual beam projectile until the pre-projectile has triggered the particle effect
scoreboard players set _c_time_until_start var 45
scoreboard players add @s projectileTimeAlive 1
execute if score @s projectileTimeAlive <= _c_time_until_start var run return 1

# Ensure that we end the beam 6 ticks after starting
scoreboard players operation _death_time var = _c_time_until_start var
scoreboard players add _death_time var 15
execute if score @s projectileTimeAlive >= _death_time var run kill @s

# get the time since the beam started
scoreboard players operation _time_since_start var = @s projectileTimeAlive
scoreboard players operation _time_since_start var -= _c_time_until_start var

# Move the particle
tp @s ^ ^ ^6

# Base particle effect
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^ 0 0 0 0 10 force
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-1 0 0 0 0 10 force
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-2 0 0 0 0 10 force
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-2 0 0 0 0 10 force
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-4 0 0 0 0 10 force
execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-5 0 0 0 0 10 force
# execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-6 0 0 0 0 10 force
# execute if score _time_since_start var matches 2.. run particle end_rod ^ ^ ^-7 0 0 0 0 10 force

execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^ 0 0 0 0 30 force
execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-1 0 0 0 0 30 force
execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-2 0 0 0 0 30 force
execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-2 0 0 0 0 30 force
execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-4 0 0 0 0 30 force
execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-5 0 0 0 0 30 force
# execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-6 0 0 0 0 30 force
# execute if score _time_since_start var matches 2.. run particle firework ^ ^ ^-7 0 0 0 0 30 force

playsound minecraft:block.beacon.power_select player @a ~ ~ ~ 32 2
execute if score _time_since_start var matches 2.. run summon firework_rocket ^ ^ ^ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,has_trail:false,colors:[I;16777215],fade_colors:[I;16775633]}]}}}}
execute if score _time_since_start var matches 2.. run summon firework_rocket ^ ^ ^-2.5 {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,has_trail:false,colors:[I;16777215],fade_colors:[I;16775633]}]}}}}

execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^ ^ {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^ {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^ {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^ {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^ {fuse:2,block_state:{Name:"minecraft:air"}}

execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^ ^-1 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-1 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-1 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-1 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-1 {fuse:2,block_state:{Name:"minecraft:air"}}

execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^ ^-2 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-2 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-2 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-2 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-2 {fuse:2,block_state:{Name:"minecraft:air"}}

execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^ ^-3 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-3 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-3 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-3 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-3 {fuse:2,block_state:{Name:"minecraft:air"}}

execute if score _time_since_start var matches 3.. at @s run summon tnt ^ ^ ^-4 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-4 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-4 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-4 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-4 {fuse:2,block_state:{Name:"minecraft:air"}}

execute if score _time_since_start var matches 3.. at @s run summon tnt ^ ^ ^-5 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-5 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-5 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-5 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-5 {fuse:2,block_state:{Name:"minecraft:air"}}

# execute if score _time_since_start var matches 3.. at @s run summon tnt ^ ^ ^-6 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-6 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-6 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-6 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-6 {fuse:2,block_state:{Name:"minecraft:air"}}

# execute if score _time_since_start var matches 3.. at @s run summon tnt ^ ^ ^-7 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^1.5 ^-7 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^ ^-1.5 ^-7 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^-1.5 ^ ^-7 {fuse:2,block_state:{Name:"minecraft:air"}}
# execute if score _time_since_start var matches 2.. at @s run summon tnt ^1.5 ^ ^-7 {fuse:2,block_state:{Name:"minecraft:air"}}

scoreboard players reset _c_time_until_start
scoreboard players reset _death_time var
scoreboard players reset _time_since_start var