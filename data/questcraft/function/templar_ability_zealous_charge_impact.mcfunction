# Calculate and deal the damage
function questcraft:templar_deal_sword_damage with storage questcraft:args

# Track that we did damage
execute store result score _damage_done var run data get storage questcraft:args damage
scoreboard players operation _templar_ability_damage_done var += _damage_done var

playsound minecraft:item.shield.block player @a ~ ~ ~ 1 0 0
particle firework ~ ~1 ~ 0.25 0.25 0.25 0.25 20

# Mark that we hit this mob this charge
$tag @s add zealous_charge_hit_$(playerId)

scoreboard players reset _damage_done var