playsound minecraft:entity.player.attack.sweep player @a ~ ~1 ~ 0.5 0 0
playsound minecraft:entity.allay.death player @a ~ ~1 ~ 0.5 2 0
particle sweep_attack ~ ~0.5 ~ 0.25 0.25 0.25 1 1 force
particle minecraft:electric_spark ~ ~0.5 ~ 0.25 0.25 0.25 1 25 force

$damage @s $(damageToDo) generic

# Track that we did damage
scoreboard players set _templar_ability_succeeded var 1