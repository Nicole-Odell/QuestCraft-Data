$bossbar add zeal_meter_$(playerId) ""

$bossbar set zeal_meter_$(playerId) players @s
$bossbar set zeal_meter_$(playerId) visible false
$bossbar set zeal_meter_$(playerId) color white
$bossbar set zeal_meter_$(playerId) max $(zealMax)
$bossbar set zeal_meter_$(playerId) value 0
$bossbar set zeal_meter_$(playerId) style notched_10

# Make sure we definitely update the soul meter display this tick
function questcraft:templar/zeal_meter_display