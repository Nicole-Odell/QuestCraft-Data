$bossbar set temperature_meter_$(playerId) name [{"color":"white","italic":true,"text":"Temperature - "},{"bold":true,"italic":true,"color":"$(temperatureEnvironmentColor)","text":"$(temperatureEnvironmentText)"}] 
$bossbar set temperature_meter_$(playerId) color $(temperatureMeterColor)
$bossbar set temperature_meter_$(playerId) value $(temperatureCurrent)
$bossbar set temperature_meter_$(playerId) max $(temperatureMax)
$bossbar set temperature_meter_$(playerId) visible $(temperatureMeterVisible)