playsound minecraft:entity.player.attack.sweep player @a ~ ~1 ~ 0.5 0 0
playsound minecraft:entity.allay.death player @a ~ ~1 ~ 0.5 2 0
particle sweep_attack ~ ~0.5 ~ 0.25 0.25 0.25 1 1 force
particle minecraft:electric_spark ~ ~0.5 ~ 0.25 0.25 0.25 1 25 force

# Calculate and deal the damage
function questcraft:templar_deal_sword_damage with storage questcraft:args

# Track that we did damage
execute store result score _templar_ability_succeeded var run data get storage questcraft:args damage

# Reset these since templar_deal_sword_damage doesn't (so we can check them)
data remove storage questcraft:args damage
data remove storage questcraft:args fireTime