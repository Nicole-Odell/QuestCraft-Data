$bossbar set temperature_meter_$(playerId) name [{"bold":true,"italic":false,"color":"aqua","text":"$(hydrationText)"},{"bold":true,"italic":false,"color":"dark_gray","text":"$(hydrationEmptyText)"},{"color":"gold","italic":true,"text":"$(temperatureFireText)"},{"bold":true,"italic":true,"color":"$(temperatureEnvironmentColor)","text":"$(temperatureEnvironmentText)"},{"color":"gold","italic":true,"text":"$(temperatureFireText)"},{"italic":true,"color":"dark_aqua","text":"$(temperatureWetnessText)"}]
$bossbar set temperature_meter_$(playerId) color $(temperatureMeterColor)
$bossbar set temperature_meter_$(playerId) value $(temperatureCurrent)
$bossbar set temperature_meter_$(playerId) max $(temperatureMax)
$bossbar set temperature_meter_$(playerId) visible $(temperatureMeterVisible)