# Get player ID for accessing the current POI data
execute store result storage questcraft:args _playerId int 1 run scoreboard players get @s playerId
function questcraft:poi_show_actionbar_status_sub with storage questcraft:args
data remove storage questcraft:args _playerId