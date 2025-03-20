# Base particle effect
execute unless score @s projectileTtl matches 120.. run particle minecraft:flame ~ ~ ~ 0 0 0 0.01 10 force

# In-flight aditional effect
execute unless score @s projectileTtl matches 120.. if entity @s[nbt={inGround:0b}] run particle minecraft:flame ^ ^ ^1 0 0 0 0.01 10 normal

# On-ground effects
execute if entity @s[nbt={inGround:1b}] run particle minecraft:flame ~ ~0.1 ~ 0.8 0 0.8 0.01 10 force
execute if entity @s[nbt={inGround:1b}] run playsound block.campfire.crackle ambient @a ~ ~ ~ 0.5 2 0

# Set nearby targets on fire when on the ground 
execute if entity @s[nbt={inGround:1b}] as @e[type=#questcraft:is_attack_targetable,distance=..3] run data modify entity @s Fire set value 40
execute if entity @s[nbt={inGround:1b}] as @e[type=#questcraft:is_attack_targetable,distance=..3] at @s run particle minecraft:flame ~ ~1 ~ 0.1 0.5 0.1 0.05 5 normal