# Mark the entity as red, unless they are already on a team and we don't want to
execute if entity @s[tag=blood_bonded,team=] run team join Red @s
execute if entity @s[tag=!blood_bonded,team=Red] run team leave @s

tag @s add raycast_targetted_entity
tag @s add raycast_targetted_entity_marked