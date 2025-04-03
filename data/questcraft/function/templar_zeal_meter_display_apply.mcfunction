$bossbar set zeal_meter_$(playerId) name [{"bold":true,"color":"gold","italic":true,"text":"Zeal: "},{"bold":true,"color":"white","text":"$(zealCurrent)"}] 
$bossbar set zeal_meter_$(playerId) value $(zealCurrent)
$bossbar set zeal_meter_$(playerId) max $(zealMax)
$bossbar set zeal_meter_$(playerId) visible $(zealMeterVisible)