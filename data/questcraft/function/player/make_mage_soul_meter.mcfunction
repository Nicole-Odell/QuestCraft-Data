$bossbar add soul_power_meter_$(mageId) ""

$bossbar set soul_power_meter_$(mageId) players @s
$bossbar set soul_power_meter_$(mageId) visible true
$bossbar set soul_power_meter_$(mageId) color blue
$bossbar set soul_power_meter_$(mageId) max $(soulPowerMax)
$bossbar set soul_power_meter_$(mageId) value $(soulPowerMax)
$bossbar set soul_power_meter_$(mageId) style notched_20

# Make sure we definitely update the soul meter display this tick
function questcraft:mage/soul_meter_display