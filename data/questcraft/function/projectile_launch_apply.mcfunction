# Summon the projectile entity
$summon $(projectileEntity) ^ ^ ^0.5 {Tags:["projectile_visual_fix","projectile_$(projectileId)","player_projectile","$(projectileTag)"],Owner:$(ownerUuid),$(projectileData)}

# Use player rotation to create an area_effect_cloud of about 0 0 and immediately copy the position of this entity into the projectile motion tag.
$execute rotated as @s positioned 0.0 0.0 0.0 positioned ^$(projectileSpeedOffsetLR) ^$(projectileSpeedOffsetUD) ^$(projectileSpeed) summon area_effect_cloud run data modify entity @n[type=$(projectileEntity),tag=projectile_$(projectileId)] Motion set from entity @s Pos

# Apply the ttl tag and score if set to nonzero
$scoreboard players set _projectile_ttl var $(projectileTtl)
$execute unless score _projectile_ttl var matches 0 run tag @n[type=$(projectileEntity),tag=projectile_$(projectileId)] add projectile_ttl
$execute unless score _projectile_ttl var matches 0 run scoreboard players set @n[type=$(projectileEntity),tag=projectile_$(projectileId)] projectileTtl $(projectileTtl)
# We want to be able to specify this in seconds, not ticks so multiply by 20 here
scoreboard players set _c_20 var 20
$execute unless score _projectile_ttl var matches 0 run scoreboard players operation @n[type=$(projectileEntity),tag=projectile_$(projectileId)] projectileTtl *= _c_20 var 

scoreboard players reset _projectile_ttl
scoreboard players reset _c_20

# Remove projectile tag
$tag @n[type=$(projectileEntity),tag=projectile_$(projectileId)] remove projectile_$(projectileId)

# Schedule the function to fix the visual bug that happens with some projectiles
schedule function questcraft:projectile_visual_fix 2t replace
