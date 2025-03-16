$bossbar set soul_power_meter_$(id) name [{"bold":true,"color":"aqua","italic":true,"text":"Soul Power: "},{"bold":true,"color":"$(soulPowerLevelColor)","text":"$(soulPowerCurrent)"},{"bold":true,"color":"white","text":" / "},{"bold":true,"color":"aqua","text":"$(soulPowerMax)"}] 
$bossbar set soul_power_meter_$(id) color $(soulPowerMeterColor)
$bossbar set soul_power_meter_$(id) value $(soulPowerCurrent)
$bossbar set soul_power_meter_$(id) max $(soulPowerMax)