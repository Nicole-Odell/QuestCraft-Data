# If they have hit the ground, cancel the float
execute unless score @s heavenlyStrikeFloatTime = _globals heavenlyStrikeFloatTime if predicate questcraft:is_on_ground run scoreboard players set @s heavenlyStrikeFloatTime 0

# For the first bit, give the player a boost to get them up higher
scoreboard players operation _float_boost_start var = _globals heavenlyStrikeFloatTime
scoreboard players remove _float_boost_start var 3

scoreboard players operation _float_boost_end var = _globals heavenlyStrikeFloatTime
scoreboard players remove _float_boost_end var 19

execute if score @s heavenlyStrikeFloatTime < _float_boost_start var if score @s heavenlyStrikeFloatTime > _float_boost_end var if block ~ ~1 ~ #air run tp @s ~ ~0.5 ~

# Playe a sound for the primed state
execute if score @s heavenlyStrikeFloatTime = _float_boost_end var run playsound entity.warden.sonic_charge player @s ~ ~1 ~ 1 0 1

# Decrement the time left floating
scoreboard players remove @s heavenlyStrikeFloatTime 1

# Keep them floating until the end of the time they can confirm the attack
execute if score @s heavenlyStrikeFloatTime matches 20.. run effect give @s minecraft:levitation 1 0 true

# Particle effect for floating
execute at @s run particle minecraft:small_gust ~ ~ ~ 0.3 0 0.3 1 25
execute at @s run particle minecraft:small_gust ~ ~-0.5 ~ 0.1 0.25 0.1 1 15

# Keep Zeal from reducing while awaiting the confirmation
scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce

# If we reach 0, remove the tracking indicating that the player is waiting to confirm the raycasted ability
execute if score @s heavenlyStrikeFloatTime matches 0 run tag @s remove templar_crouch_jump_heavenly_strike_ready
execute if score @s heavenlyStrikeFloatTime matches 0 run scoreboard players set @s templar.isAbilityPrimed 0
execute if score @s heavenlyStrikeFloatTime matches 0 run effect give @s minecraft:slow_falling 5 0 true
execute if score @s heavenlyStrikeFloatTime matches 0 run playsound block.redstone_torch.burnout player @s ~ ~1 ~ 1 2 1

scoreboard players reset _float_boost_start var
scoreboard players reset _float_boost_end var