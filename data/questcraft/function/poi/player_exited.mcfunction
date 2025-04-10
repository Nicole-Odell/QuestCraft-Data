# Get the player ID in args for clearing current POI info from player_data
execute store result storage questcraft:args _playerId int 1 run scoreboard players get @s playerId

# Mark us as not in any poi type if we are far enough away from any
execute if score @s currentPoiType matches 1.. run function questcraft:poi/player_exited_sub with storage questcraft:args

# Revoke exit only if we are still in a POI.
# This way when we are not in any POI, we can save performance until we enter one again.
execute if score @s currentPoiType matches 1.. run advancement revoke @s only questcraft:exited_poi

data remove storage questcraft:args _playerId