$bossbar add soul_power_meter_$(id) ""

$bossbar set soul_power_meter_$(id) players @s
$bossbar set soul_power_meter_$(id) visible true
$bossbar set soul_power_meter_$(id) color blue
$bossbar set soul_power_meter_$(id) max $(soulPowerMax)
$bossbar set soul_power_meter_$(id) value $(soulPowerMax)
$bossbar set soul_power_meter_$(id) style notched_20

# Make sure we definitely update the soul meter display this tick
function questcraft:mage_soul_meter_display