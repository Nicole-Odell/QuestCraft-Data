$bossbar add temperature_meter_$(playerId) ""

$bossbar set temperature_meter_$(playerId) players @s
$bossbar set temperature_meter_$(playerId) visible false
$bossbar set temperature_meter_$(playerId) color green
$bossbar set temperature_meter_$(playerId) max $(temperatureMax)
$bossbar set temperature_meter_$(playerId) value $(temperatureCurrent)
$bossbar set temperature_meter_$(playerId) style notched_6

# Make sure we definitely update the temperature meter display this tick
function questcraft:environment/player_temperature_meter_display