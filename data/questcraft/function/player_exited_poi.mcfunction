# Mark us as not in any poi type if we are far enough away from any
execute if score @s currentPoiType matches 1.. run function questcraft:player_exited_poi_sub with storage questcraft:args

# Revoke exit only if we are still in a POI.
# This way when we are not in any POI, we can save performance until we enter one again.
execute if score @s currentPoiType matches 1.. run advancement revoke @s only questcraft:exited_poi