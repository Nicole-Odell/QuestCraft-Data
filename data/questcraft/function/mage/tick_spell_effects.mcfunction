# Cooling Aura
execute as @a[tag=cooling_aura] at @s run function questcraft:mage/spell/cooling_aura/tick

# Impact
execute as @e[type=area_effect_cloud,tag=impact_projectile] at @s run function questcraft:mage/spell/impact/projectile_tick

# Firebolt
execute as @e[type=arrow,tag=firebolt_projectile] at @s run function questcraft:mage/spell/firebolt/projectile_tick

# Icewind
execute as @e[type=area_effect_cloud,tag=icewind_projectile] at @s run function questcraft:mage/spell/icewind/projectile_tick

# Ward
execute as @a[tag=ward_active] at @s run function questcraft:mage/spell/ward/tick

# Bumble Dry
execute as @a[tag=bumble_dry] at @s run function questcraft:mage/spell/bumble_dry/tick

# Blood Bond
scoreboard players set @e[tag=blood_bonded] bloodBond.castedToThisTick 0
execute as @e[type=#questcraft:is_attack_targetable,tag=blood_bonded] at @s run function questcraft:mage/spell/bloodbond/tick
execute as @a[scores={bloodBondPower=1..}] at @s run function questcraft:mage/spell/bloodbond/tick_player

# Hyper Beam
execute as @e[type=area_effect_cloud,tag=hyperbeam_pre_projectile] at @s run function questcraft:mage/spell/hyperbeam/cast_projectile_pre_tick
execute as @e[type=area_effect_cloud,tag=hyperbeam_projectile] at @s run function questcraft:mage/spell/hyperbeam/cast_projectile_tick