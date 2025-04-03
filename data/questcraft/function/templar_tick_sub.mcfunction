execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

# Reduce the cooldown until an ability can be cast again
execute unless score @s templar.abilityCooldown matches 0 run scoreboard players remove @s templar.abilityCooldown 1

# Update charging state of sword and crouch
execute if score @s templar.swordCharge matches 1.. run function questcraft:templar_sword_charge_tick

# Handle active effects related to abilities
execute if score @s zealousChargeTime matches 1.. at @s run function questcraft:templar_ability_zealous_charge_tick with storage questcraft:args

# If zeal is at zero and hasn't changed since last tick, no need to do anything of the below. Make sure we update the display and reset cooldowns
execute if score @s zeal.current matches 0 if score @s zeal.added matches 0 run scoreboard players set @s zeal.timeUntilReduce 0
execute if score @s zeal.current matches 0 if score @s zeal.added matches 0 run function questcraft:templar_zeal_meter_display with storage questcraft:args
execute if score @s zeal.current matches 0 if score @s zeal.added matches 0 run return 1

# Add the new zeal at a 1/10 rate to their zeal bar. Clamp it at the max value
scoreboard players operation _zeal_added_scaled var = @s zeal.added
scoreboard players set _c_10 var 10
scoreboard players operation _zeal_added_scaled var /= _c_10 var
scoreboard players operation @s zeal.current += _zeal_added_scaled var
execute if score @s zeal.current > @s zeal.max run scoreboard players operation @s zeal.current = @s zeal.max

# If there was new zeal added this tick, reset the time until it starts to reduce
execute if score @s zeal.added matches 1.. run scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce

# Reset the added zeal for the next tick
scoreboard players set @s zeal.added 0

# Decrement the time until zeal starts to reduce
execute unless score @s zeal.timeUntilReduce matches 0 run scoreboard players remove @s zeal.timeUntilReduce 1

# If the time to reduce is at 0, reduce zeal. Clamp it at 0
execute if score @s zeal.timeUntilReduce matches 0 run scoreboard players operation @s zeal.current -= _globals zeal.reductionSpeed
execute if score @s zeal.current matches ..0 run scoreboard players set @s zeal.current 0

# Update display of the zeal bar
function questcraft:templar_zeal_meter_display with storage questcraft:args

scoreboard players reset _zeal_added_scaled var
scoreboard players reset _c_10 var

data remove storage questcraft:args playerId