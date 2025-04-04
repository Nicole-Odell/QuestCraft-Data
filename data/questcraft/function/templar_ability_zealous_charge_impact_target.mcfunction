# Calculate and deal the damage twice for hitting the taarget
function questcraft:templar_deal_sword_damage with storage questcraft:args
function questcraft:templar_deal_sword_damage with storage questcraft:args

# Track that we did damage. Account for the doube damage
execute store result score _damage_done var run data get storage questcraft:args damage
scoreboard players operation _templar_ability_damage_done var += _damage_done var
scoreboard players operation _templar_ability_damage_done var += _damage_done var

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