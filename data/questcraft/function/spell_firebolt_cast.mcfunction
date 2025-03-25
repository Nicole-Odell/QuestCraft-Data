# Play the particle and sound effects
execute at @s anchored eyes run playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 0.5 1.5 0
execute at @s anchored eyes run playsound minecraft:item.firecharge.use player @a ~ ~ ~ 0.5 1.5 0
execute at @s anchored eyes run playsound minecraft:item.flintandsteel.use player @a ~ ~ ~ 0.5 1.1 0
execute at @s anchored eyes run particle minecraft:flame ^-0.4 ^-0.15 ^0.35 0 0 0 0.15 25 force @a

# Launch the projectile
execute at @s anchored eyes run function questcraft:projectile_launch {projectileEntity:"minecraft:arrow", projectileSpeed:5, projectileSpeedOffsetLR:0., projectileSpeedOffsetUD:0, projectileTag:"firebolt_fireball", projectileData:"pickup:2,PierceLevel:10,Fire:2000,SoundEvent:'minecraft:entity.blaze.shoot'", projectileTtl:6}