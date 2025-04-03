# To save performance, only ever check this once per tick, and stop checking it once it becomes true
execute unless score @s projectileHasImpacted matches 1 run execute if entity @s[nbt={inGround:1b}] run scoreboard players set @s projectileHasImpacted 1 

# kill it if it hits water
execute if block ~ ~ ~ water run particle minecraft:bubble_pop ~ ~ ~ 0.1 0.3 0.1 0.1 50 force
execute if block ~ ~ ~ water run particle minecraft:splash ~ ~1 ~ 0.1 0.5 0.1 0.5 50 force
execute if block ~ ~ ~ water run kill @s

# Base particle effect
execute unless score @s projectileTtl matches 120.. run particle minecraft:flame ~ ~ ~ 0 0 0 0.01 10 force

# In-flight aditional effect
execute unless score @s projectileHasImpacted matches 1 unless score @s projectileTtl matches 120.. run particle minecraft:flame ^ ^ ^1 0 0 0 0.01 10 normal

# Melt ice
fill ^-1 ^-1 ^-1 ^1 ^1 ^1 water replace ice
fill ^-1 ^-1 ^-1 ^1 ^1 ^1 water replace frosted_ice

# On-ground effects
execute if score @s projectileHasImpacted matches 1 run particle minecraft:flame ~ ~0.1 ~ 0.8 0 0.8 0.01 10 force
execute if score @s projectileHasImpacted matches 1 run playsound block.campfire.crackle ambient @a ~ ~ ~ 0.5 2 0

# Set nearby targets on fire when on the ground 
execute if score @s projectileHasImpacted matches 1 as @e[type=#questcraft:is_attack_targetable,distance=..3] run data modify entity @s Fire set value 40
execute if score @s projectileHasImpacted matches 1 as @e[type=#questcraft:is_attack_targetable,distance=..3] at @s run particle minecraft:flame ~ ~1 ~ 0.1 0.5 0.1 0.05 5 normal