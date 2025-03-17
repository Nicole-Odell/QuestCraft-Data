$bossbar set soul_power_meter_$(mageId) name [{"bold":true,"color":"aqua","italic":true,"text":"Soul Power: "},{"bold":true,"color":"$(soulPowerLevelColor)","text":"$(soulPowerCurrent)"},{"bold":true,"color":"white","text":" / "},{"bold":true,"color":"aqua","text":"$(soulPowerMax)"}] 
$bossbar set soul_power_meter_$(mageId) color $(soulPowerMeterColor)
$bossbar set soul_power_meter_$(mageId) value $(soulPowerCurrent)
$bossbar set soul_power_meter_$(mageId) max $(soulPowerMax)