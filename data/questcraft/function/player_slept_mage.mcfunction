# For mages, restore their soul power to full
execute if score @s isMage matches 1 run title @s actionbar [{"italic":true,"color":"aqua","text":"Sould Power restored to full!"}]
execute if score @s isMage matches 1 at @s run playsound minecraft:entity.allay.item_thrown player @s ~ ~ ~ 0.5 0 0
execute if score @s isMage matches 1 at @s run playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 0.5 2 0
execute if score @s isMage matches 1 run scoreboard players operation @s soulPower.current = @s soulPower.max