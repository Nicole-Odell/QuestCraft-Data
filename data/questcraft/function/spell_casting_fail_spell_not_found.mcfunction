# Show the cast message
execute at @s run playsound minecraft:block.amethyst_cluster.break player @s ~ ~ ~ 0.5 0 0.5
title @s actionbar [{"bold":true,"color":"yellow","text":"-^-<| "},{"color":"gold","text":"(X Cast Failed - Invalid Spell X) "},{"bold":true,"color":"yellow","text":"|>-^-"}]
function questcraft:player_actionbar_no_override

# Mark the player as not casting a raycast targetted spell
scoreboard players set @s isCastingPrimed 0

# Clear the spell buffer of the invalid spell
$data modify storage questcraft:mage_data mages[$(mageId)].spell set value []