# Mark the player as not in a POI
scoreboard players set @s currentPoiType 0

# Remove the POI info which was stored for the actionbar
$data remove storage questcraft:player_data players[$(_playerId)].currentPoiName
$data remove storage questcraft:player_data players[$(_playerId)].currentPoiSafeStatus


tell @a[tag=admin] @s exited POI