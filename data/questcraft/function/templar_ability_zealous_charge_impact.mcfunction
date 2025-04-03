damage @s 20

playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 1 0
playsound minecraft:entity.player.attack.crit player @a ~ ~ ~ 1 0 0

particle firework ~ ~1 ~ 0.25 0.25 0.25 0.25 20
particle crit ~ ~1 ~ 0.25 0.25 0.25 0.5 20

$tag @s remove zealous_charge_target_$(playerId)
effect clear @s glowing
effect clear @s slowness