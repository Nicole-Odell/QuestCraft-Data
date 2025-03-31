execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

execute if predicate questcraft:is_in_poi_castle run function questcraft:player_entered_poi_castle with storage questcraft:args
execute if predicate questcraft:is_in_poi_kingdom run function questcraft:player_entered_poi_kingdom with storage questcraft:args
execute if predicate questcraft:is_in_poi_mansion run function questcraft:player_entered_poi_mansion with storage questcraft:args
execute if predicate questcraft:is_in_poi_tavern run function questcraft:player_entered_poi_tavern with storage questcraft:args
execute if predicate questcraft:is_in_poi_tower run function questcraft:player_entered_poi_tower with storage questcraft:args
execute if predicate questcraft:is_in_poi_village run function questcraft:player_entered_poi_village with storage questcraft:args

# Mark them as being in a POI
scoreboard players set @s isInPoi 1

scoreboard players reset _was_not_in_poi_type var

data remove storage questcraft:args playerId


advancement revoke @s only questcraft:entered_poi
# Revoke exited here too, since it won't revoke itself if we go away from any POIs, to save performance
advancement revoke @s only questcraft:exited_poi