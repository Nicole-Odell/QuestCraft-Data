# Show the cast message
execute at @s run playsound minecraft:block.amethyst_cluster.break player @s ~ ~ ~ 0.5 0 0.5
title @s actionbar [{"bold":true,"color":"yellow","text":"-^-<| "},{"color":"gold","text":"(# Cast Failed - Not enough power #) "},{"bold":true,"color":"yellow","text":"|>-^-"}]
function questcraft:player/set_actionbar_no_override

# Mark the player as not casting a raycast targetted spell
scoreboard players set @s isCastingPrimed 0

# Clear the spell buffer since we failed to cast
$data modify storage questcraft:mage_data mages[$(mageId)].spell set value []