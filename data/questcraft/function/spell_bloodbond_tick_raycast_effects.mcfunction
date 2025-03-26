execute if score @s bloodBond.castedToThisTick matches 1 run scoreboard players set _found_player var 1
execute if score @s bloodBond.castedToThisTick matches 1 run return 1

tag @s add blood_bonded_hit
$tag @s remove blood_bonded_$(mageId)

scoreboard players add _rec_checks var 1
$execute if entity @p[tag=blood_bonded_$(mageId),distance=..16] run scoreboard players set _found_player var 1
$execute if score _found_player var matches 1 as @s at @s anchored feet facing entity @p[tag=blood_bonded_$(mageId),distance=..16] feet positioned ~ ~1 ~ run function questcraft:raycast with storage questcraft:args

$execute if score _found_player var matches 0 as @e[tag=blood_bonded_$(mageId),tag=!blood_bonded_hit,distance=..16] run function questcraft:spell_bloodbond_tick_raycast_effects_sub with storage questcraft:args

$tag @s add blood_bonded_$(mageId)
tag @s remove blood_bonded_hit