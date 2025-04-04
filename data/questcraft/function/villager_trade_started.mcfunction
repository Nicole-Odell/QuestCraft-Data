advancement revoke @s only questcraft:started_villager_trading



execute as @e[type=minecraft:villager,tag=!villager_inited,distance=..5] at @s run function questcraft:villager_init