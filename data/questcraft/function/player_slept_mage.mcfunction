# For mages, restore their soul power to full
title @s actionbar [{"italic":true,"color":"aqua","text":"Sould Power restored to full!"}]
function questcraft:player_actionbar_no_override

execute at @s run playsound minecraft:entity.allay.item_thrown player @s ~ ~ ~ 0.5 0 0
execute at @s run playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 0.5 2 0
scoreboard players operation @s soulPower.current = @s soulPower.max