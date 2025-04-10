$bossbar set zeal_meter_$(playerId) name [{"bold":true,"color":"gold","italic":true,"text":"Zeal: "},{"bold":true,"color":"white","text":"$(zealCurrent) / $(zealMax)"},{"bold":true,"color":"$(zealMeterColor)","text":"$(zealAbilitiesMarkers)"}] 
$bossbar set zeal_meter_$(playerId) value $(zealCurrent)
$bossbar set zeal_meter_$(playerId) max $(zealBarMax)
$bossbar set zeal_meter_$(playerId) color $(zealMeterColor)
$bossbar set zeal_meter_$(playerId) visible $(zealMeterVisible)