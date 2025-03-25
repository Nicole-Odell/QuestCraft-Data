# Dumb reflect that just reverses lateral direction. Not physically accurate unless all shots hit at exactly normal angles
data modify storage questcraft:args projectileDeflectMotion set value [0.0d, 0.0d, 0.0d]
# data modify storage questcraft:args projectileDeflectRotation set value [0.0d, 0.0d, 0.0d]

execute store result storage questcraft:args projectileDeflectMotion[0] double -0.3 run data get entity @s Motion[0]
execute store result storage questcraft:args projectileDeflectMotion[1] double 1 run data get entity @s Motion[1]
execute store result storage questcraft:args projectileDeflectMotion[2] double -0.3 run data get entity @s Motion[2]
# execute store result storage questcraft:args projectileDeflectRotation[0] double -1 run data get entity @s Rotation[0]
# execute store result storage questcraft:args projectileDeflectRotation[1] double 1 run data get entity @s Rotation[1]

data modify entity @s Motion[0] set from storage questcraft:args projectileDeflectMotion[0]
data modify entity @s Motion[1] set from storage questcraft:args projectileDeflectMotion[1]
data modify entity @s Motion[2] set from storage questcraft:args projectileDeflectMotion[2]
# data modify entity @s Rotation[0] set from storage questcraft:args projectileDeflectRotation[0]
# data modify entity @s Rotation[1] set from storage questcraft:args projectileDeflectRotation[1]

execute at @s run particle enchanted_hit ~ ~ ~ 0 0 0 1 10

data remove storage questcraft:args projectileDeflectMotion
# data remove storage questcraft:args projectileDeflectRotation