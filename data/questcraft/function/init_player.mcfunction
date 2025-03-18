# Give the player an ID, used for various player-specific functionality
scoreboard players operation @s playerId = _globals nextPlayerId
scoreboard players add _globals nextPlayerId 1

# Get the player ID into args to pass to other init methods
execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

# Player stats
scoreboard players operation @s temperature.current = _globals temperature.midpoint
scoreboard players operation @s temperature.environmentCurrent = _globals temperature.midpoint
scoreboard players set @s wetness.current 0
scoreboard players set @s hydration 0
scoreboard players set @s isNearWarmth 0

# Set up the player's temperature meter
execute store result storage questcraft:args temperatureMax int 1 run scoreboard players get _globals temperature.max
execute store result storage questcraft:args temperatureCurrent int 1 run scoreboard players get @s temperature.current
function questcraft:make_player_temperature_meter with storage questcraft:args