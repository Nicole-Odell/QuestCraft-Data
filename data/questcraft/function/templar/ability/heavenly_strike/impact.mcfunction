# Raycast a trail back to the player
data modify storage questcraft:args rayCastRange set value 48
data modify storage questcraft:args rayCastStepFunction set value "questcraft:templar/ability/heavenly_strike/raycast_step_particle"
data modify storage questcraft:args rayCastBlockPassThroughFilter set value ""
data modify storage questcraft:args rayCastBlockImpactFunction set value "questcraft:nop"
$data modify storage questcraft:args rayCastEntityTargettableFilter set value "type=player,scores={playerId=$(playerId)}"
data modify storage questcraft:args rayCastEntityImpactRadius set value "1.5"
data modify storage questcraft:args rayCastEntityImpactFunction set value "questcraft:nop"
data modify storage questcraft:args rayCastMaxRangeFunction set value "questcraft:nop"

execute facing entity @s eyes run function questcraft:raycasting/start with storage questcraft:args

data remove storage questcraft:args rayCastRange
data remove storage questcraft:args rayCastStepFunction
data remove storage questcraft:args rayCastBlockPassThroughFilter
data remove storage questcraft:args rayCastBlockImpactFunction
data remove storage questcraft:args rayCastEntityTargettableFilter
data remove storage questcraft:args rayCastEntityImpactRadius
data remove storage questcraft:args rayCastEntityImpactFunction
data remove storage questcraft:args rayCastMaxRangeFunction

# Play Impact sounds
playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 1 2 0
playsound minecraft:entity.lightning_bolt.impact player @a ~ ~ ~ 1 2 0
playsound minecraft:item.trident.thunder player @a ~ ~ ~ 1 2 0

# Play impact particle effects
particle explosion ~ ~1 ~ 4 0.5 4 0.1 50 force
particle explosion_emitter ~ ~1 ~ 0 0 0 0.1 1 force
execute at @s positioned as @s rotated ~ 0.0 run particle firework ^ ^ ^4 0.1 0.1 0.1 0.5 100 force

# Deal sword damage to targets in range. Deal more damage the closer they are to the center
# Note that only the first of these will take effect for a given mob, since they can only take damage once per tick
scoreboard players set _templar_damage_multiplier var 4
execute as @e[type=#questcraft:is_attack_targetable,distance=..2] run function questcraft:templar/deal_sword_damage with storage questcraft:args
scoreboard players set _templar_damage_multiplier var 3
execute as @e[type=#questcraft:is_attack_targetable,distance=..4] run function questcraft:templar/deal_sword_damage with storage questcraft:args
scoreboard players set _templar_damage_multiplier var 2
execute as @e[type=#questcraft:is_attack_targetable,distance=..8] run function questcraft:templar/deal_sword_damage with storage questcraft:args
scoreboard players set _templar_damage_multiplier var 1
execute as @e[type=#questcraft:is_attack_targetable,distance=..12] run function questcraft:templar/deal_sword_damage with storage questcraft:args
scoreboard players reset _templar_damage_multiplier var

# Summon breeze charges to scatter enemies
summon breeze_wind_charge ~-4 ~0.6 ~ {Motion:[0.0,-0.5,0.0]}
summon breeze_wind_charge ~4 ~0.6 ~ {Motion:[0.0,-0.5,0.0]}
summon breeze_wind_charge ~ ~0.6 ~-4 {Motion:[0.0,-0.5,0.0]}
summon breeze_wind_charge ~ ~0.6 ~4 {Motion:[0.0,-0.5,0.0]}

# Make sure it is at least 1 so we know the impact occurred
scoreboard players set _templar_ability_succeeded var 1
# Track that we did damage
scoreboard players operation _templar_ability_succeeded var += _templar_ability_damage_done var
scoreboard players reset _templar_ability_damage_done var

# tp the player to the impact point
tp @s ~ ~0.5 ~