execute at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.5 2 0
execute at @s run playsound minecraft:block.amethyst_cluster.step player @a ~ ~ ~ 0.75 2 0
execute at @s run playsound minecraft:entity.villager.work_cleric player @a ~ ~ ~ 0.25 2 0

execute at @s run particle minecraft:heart ^ ^1 ^0.25 0.3 0.5 0.3 0.5 5 force @a

# Determine how much absorption to apply for overheal, if any
scoreboard players operation _absorption_health_amplifier var = @s health 
# The regular healing is 16, so we would do health + 16 - 20 to get the overheal amount, which is the same as subtracting 4 from the health 
scoreboard players set _c_4 var 4
scoreboard players operation _absorption_health_amplifier var -= _c_4 var
execute if score _absorption_health_amplifier var matches ..-1 run scoreboard players set _absorption_health_amplifier var 0

# Absorption is 4 health per level, so divide by 4, then subtract 1 to get the amplifier
scoreboard players operation _absorption_health_amplifier var /= _c_4 var
scoreboard players remove _absorption_health_amplifier var 1

# Apply the regular healing
effect give @s minecraft:instant_health 1 2

# Apply the overheal, if any, as absorption
execute store result storage questcraft:args absorptionAmplifier int 1 run scoreboard players get _absorption_health_amplifier var
execute if score _absorption_health_amplifier var matches 0.. unless predicate questcraft:has_absorption run function questcraft:spell_heal_major_cast_sub with storage questcraft:args

data remove storage questcraft:args absorptionAmplifier

scoreboard players reset _absorption_health_amplifier var
scoreboard players reset _c_4 var