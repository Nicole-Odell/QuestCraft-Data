# Don't bother if we are in an environment that isn't cold. (Saves performance)
# execute if score @s temperature.environmentCurrent matches 0.. run return 1

scoreboard players set @s isNearWarmth 0

execute if score _globals printDebug matches 0 run scoreboard players reset _isWarmth var
execute if score _globals printDebug matches 1 run scoreboard players set _isWarmth var 0

# Check every goddamn block in a 7x7x3 cube until we find one

# 1 below player. We set it to 2 here to indicate it is below
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-3 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~3 ~-1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2


# 2 below player. Only check 2x2 for this. We set it to 2 here to indicate it is below
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-2 ~-2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~-1 ~-2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~-1 ~-2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~ ~-2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~ ~-2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~1 ~-2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~1 ~-2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2

execute if score @s isNearWarmth matches 0 positioned ~2 ~-2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2
execute if score @s isNearWarmth matches 0 positioned ~2 ~-2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 2


# Level with player
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~ ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~ ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

# 1 above player
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-3 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~-3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~3 ~1 ~3 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1


# 2 above player. Only check 2x2 for this
execute if score @s isNearWarmth matches 0 positioned ~-2 ~2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-2 ~2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~-1 ~2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~-1 ~2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~ ~2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~ ~2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~1 ~2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~1 ~2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1

execute if score @s isNearWarmth matches 0 positioned ~2 ~2 ~-2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~2 ~-1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~2 ~ if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~2 ~1 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1
execute if score @s isNearWarmth matches 0 positioned ~2 ~2 ~2 if predicate questcraft:is_block_warm run scoreboard players set @s isNearWarmth 1


execute if score _globals printDebug matches 1 if score @s isNearWarmth matches 1.. run scoreboard players operation _isWarmth var = @s isNearWarmth