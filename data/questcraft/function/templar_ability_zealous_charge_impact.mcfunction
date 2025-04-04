# Calculate and deal the damage
function questcraft:templar_deal_sword_damage with storage questcraft:args

playsound minecraft:item.shield.block player @a ~ ~ ~ 1 0 0
particle firework ~ ~1 ~ 0.25 0.25 0.25 0.25 20

# Mark that we hit this mob this charge
$tag @s add zealous_charge_hit_$(playerId)

scoreboard players reset _damage_done var