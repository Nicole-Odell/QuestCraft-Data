# Reset the player's status
function questcraft:player/status_reset

execute if score @s isMage matches 1 run function questcraft:player/slept_mage