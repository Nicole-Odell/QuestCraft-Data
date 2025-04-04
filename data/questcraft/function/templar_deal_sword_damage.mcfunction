execute store result score _sword_damage var run data get storage questcraft:args swordDamage
execute store result score _undead_damage var run data get storage questcraft:args swordUndeadDamage
execute store result score _arthropod_damage var run data get storage questcraft:args swordArthropodDamage
execute store result score _fire_time var run data get storage questcraft:args swordFireTime

# Determine the damage type to apply. Only count as applying smite or bane of arthropods if they are actually on the sword
scoreboard players set _damage_type var 0
execute if entity @s[type=#undead] unless score _undead_damage var = _sword_damage var run scoreboard players set _damage_type var 1
execute if entity @s[type=#arthropod] unless score _arthropod_damage var = _sword_damage var run scoreboard players set _damage_type var 2

# Set the final damage based on type
execute if score _damage_type var matches 0 run scoreboard players operation _final_damage var = _sword_damage var
execute if score _damage_type var matches 1 run scoreboard players operation _final_damage var = _undead_damage var
execute if score _damage_type var matches 2 run scoreboard players operation _final_damage var = _arthropod_damage var

# Apply the optional damage multiplier
execute if score _templar_damage_multiplier var matches 1.. run scoreboard players operation _final_damage var *= _templar_damage_multiplier var

# Store the final damage for the damage function to use
execute store result storage questcraft:args damage int 1 run scoreboard players get _final_damage var

# Detrmine if there is any fire time to apply
execute if score _fire_time var matches 1.. run execute store result storage questcraft:args fireTime int 1 run scoreboard players get _fire_time var

# Get the health of the target before damage is applied
execute store result score _target_health var run data get entity @s Health

# Apply the damage to the target, with or without fire appropriately
execute unless score _fire_time var matches 1.. run function questcraft:damage_target with storage questcraft:args
execute if score _fire_time var matches 1.. run function questcraft:damage_target_fire with storage questcraft:args

# PLay particle effects based on the special damage types
execute if score _damage_type var matches 1.. run particle minecraft:enchanted_hit ~ ~1 ~ 0 0.25 0 1 20 normal
execute if score _fire_time var matches 1.. run particle minecraft:flame ~ ~1 ~ 0.25 0.25 0.25 0.1 20 normal

# Track the damage done. We add to this so callers can more easily track damage over multiple hits
# Clamp the damage done at the entities actual health
execute if score _final_damage var > _target_health var run scoreboard players operation _final_damage var = _target_health var
execute unless score _templar_ability_damage_done var matches 1.. run scoreboard players set _templar_ability_damage_done var 0
scoreboard players operation _templar_ability_damage_done var += _final_damage var

scoreboard players reset _sword_damage var
scoreboard players reset _undead_damage var
scoreboard players reset _arthropod_damage var
scoreboard players reset _fire_time var
scoreboard players reset _damage_type var
scoreboard players reset _final_damage var
scoreboard players reset _templar_ability_damage_done_sub var
scoreboard players reset _target_health var
# Don't reset _templar_ability_damage_done so that the caller can know how much damage was dealt

data remove storage questcraft:args damage
data remove storage questcraft:args fireTime