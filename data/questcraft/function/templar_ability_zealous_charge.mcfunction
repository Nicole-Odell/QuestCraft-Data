$tag @s add zealous_charge_target_$(playerId)
effect give @s minecraft:glowing infinite 0 true
effect give @s minecraft:slowness infinite 4 true
particle wax_on ~ ~0.5 ~ 0.3 0.3 0.3 0.5 30 force

scoreboard players set _templar_ability_succeeded var 1