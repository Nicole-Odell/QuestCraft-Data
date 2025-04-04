# Calculate and deal the damage twice for hitting the taarget
scoreboard players set _templar_damage_multiplier var 2
function questcraft:templar_deal_sword_damage with storage questcraft:args
scoreboard players reset _templar_damage_multiplier var

playsound minecraft:item.shield.block player @a ~ ~ ~ 1 0 0
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 1 0
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0 0

particle firework ~ ~1 ~ 0.25 0.25 0.25 0.25 20
particle crit ~ ~1 ~ 0.25 0.25 0.25 0.5 20

# Mark that we hit this mob this charge
$tag @s add zealous_charge_hit_$(playerId)

# Make this no longer the target of the charge. We can only do double damaage to the target once
$tag @s remove zealous_charge_target_$(playerId)
effect clear @s glowing
effect clear @s slowness

scoreboard players reset _damage_done var