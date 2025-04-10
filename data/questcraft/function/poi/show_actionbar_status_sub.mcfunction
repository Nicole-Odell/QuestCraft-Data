$data modify storage questcraft:args currentPoiName set from storage questcraft:player_data players[$(_playerId)].currentPoiName

$execute store result score _poi_safe_status var run data get storage questcraft:player_data players[$(_playerId)].currentPoiSafeStatus

execute if score _poi_safe_status var matches -1 run data modify storage questcraft:args currentPoiSafeStatusText set value "Hostile"
execute if score _poi_safe_status var matches -1 run data modify storage questcraft:args currentPoiSafeStatusTextColor set value "dark_red"
execute if score _poi_safe_status var matches 0 run data modify storage questcraft:args currentPoiSafeStatusText set value ""
execute if score _poi_safe_status var matches 0 run data modify storage questcraft:args currentPoiSafeStatusTextColor set value "white"
execute if score _poi_safe_status var matches 1 run data modify storage questcraft:args currentPoiSafeStatusText set value "Safe"
execute if score _poi_safe_status var matches 1 run data modify storage questcraft:args currentPoiSafeStatusTextColor set value "dark_green"

function questcraft:poi/show_actionbar_status_sub_apply with storage questcraft:args

scoreboard players reset _poi_safe_status var

data remove storage questcraft:args currentPoiName
data remove storage questcraft:args currentPoiSafeStatusText
data remove storage questcraft:args currentPoiSafeStatusTextColor