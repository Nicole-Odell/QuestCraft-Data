# Reset the player's status
function questcraft:player_status_reset

execute if score @s isMage matches 1 run function questcraft:player_slept_mage