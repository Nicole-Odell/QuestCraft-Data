execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

# Set the args that the raycast entity impact function will use for damage
execute store result storage questcraft:args swordDamage int 1 run scoreboard players get @s templar.swordDamage
execute store result storage questcraft:args swordUndeadDamage int 1 run scoreboard players get @s templar.swordUndeadDamage
execute store result storage questcraft:args swordArthropodDamage int 1 run scoreboard players get @s templar.swordArthropodDamage
execute store result storage questcraft:args swordFireTime int 1 run scoreboard players get @s templar.swordFireTime

# Reduce the cooldown until an ability can be cast again
execute unless score @s templar.abilityCooldown matches 0 run scoreboard players remove @s templar.abilityCooldown 1

# Increment crouching charge if they are crouching
execute if predicate questcraft:is_crouching run scoreboard players add @s templar.crouchCharge 1
# Update charging state of sword right click and crouch
execute if score @s templar.swordCharge matches 1.. run function questcraft:templar/sword_charge_tick
execute if score @s templar.crouchCharge matches 1.. run function questcraft:templar/crouch_charge_tick

# Activate the raycasting target marker for readied abilities
execute if entity @s[tag=templar_right_click_hold_ready] run data modify storage questcraft:args rayCastRange set value 16
execute if entity @s[tag=templar_right_click_hold_ready] at @s run function questcraft:templar/target_raycast_entity
execute if entity @s[tag=templar_crouch_jump_heavenly_strike_ready] run data modify storage questcraft:args rayCastRange set value 48
execute if entity @s[tag=templar_crouch_jump_heavenly_strike_ready] run function questcraft:templar/target_raycast_block
data remove storage questcraft:args rayCastRange

# Handle active effects related to abilities
execute if score @s zealousChargeTime matches 1.. at @s run function questcraft:templar/ability/zealous_charge/tick with storage questcraft:args
execute if score @s heavenlyStrikeFloatTime matches 1.. at @s run function questcraft:templar/ability/heavenly_strike/tick with storage questcraft:args

# Ensure that zeal is clamped between 0 and the max
execute if score @s zeal.current matches ..0 run scoreboard players set @s zeal.current 0
execute if score @s zeal.current > @s zeal.max run scoreboard players operation @s zeal.current = @s zeal.max

# Determine the Zeal level based on the ability costs
execute if score @s zeal.current matches 0 run scoreboard players set @s zeal.currentLevel 0
execute if score @s zeal.current matches 1.. if score @s zeal.current < _globals templar.holdClickAbilityCost run scoreboard players set @s zeal.currentLevel 1
execute if score @s zeal.current >= _globals templar.holdClickAbilityCost if score @s zeal.current < _globals templar.crouchJumpAbilityCost run scoreboard players set @s zeal.currentLevel 2
execute if score @s zeal.current >= _globals templar.crouchJumpAbilityCost if score @s zeal.current < _globals templar.crouchClickAbilityCost run scoreboard players set @s zeal.currentLevel 3
execute if score @s zeal.current >= _globals templar.crouchClickAbilityCost run scoreboard players set @s zeal.currentLevel 4

# Update zeal-level-based effects 

execute if score @s zeal.currentLevel matches 0 run effect clear @s resistance

execute if score @s zeal.currentLevel matches 1 run effect give @s resistance 1 0 true
# execute if score @s zeal.currentLevel matches 1 run particle dust_color_transition{from_color:[1.0,0.7,0.0],scale:0.4,to_color:[0.0,0.0,0.0]} ~ ~1.7 ~ 0.35 0 0.35 1 2

execute if score @s zeal.currentLevel matches 2 run effect give @s resistance 1 1 true
# execute if score @s zeal.currentLevel matches 2 run particle dust_color_transition{from_color:[1.0,1.0,0.0],scale:0.4,to_color:[1.0,1.0,1.0]} ~ ~1.7 ~ 0.35 0 0.35 1 2

execute if score @s zeal.currentLevel matches 3 run effect give @s resistance 1 2 true
# execute if score @s zeal.currentLevel matches 3 run particle dust_color_transition{from_color:[1.0,1.0,0.7],scale:0.4,to_color:[1.0,1.0,1.0]} ~ ~1.7 ~ 0.35 0 0.35 1 4
execute if score @s zeal.currentLevel matches 3 run particle wax_off ~ ~2 ~ 0.35 0 0.35 1 1

execute if score @s zeal.currentLevel matches 4 run effect give @s resistance 1 3 true
execute if score @s zeal.currentLevel matches 4 run particle dust_color_transition{from_color:[0.8,0.8,1.0],scale:0.4,to_color:[0.0,0.0,0.0]} ~ ~1.7 ~ 0.35 0 0.35 1 8
execute if score @s zeal.currentLevel matches 4 run particle electric_spark ~ ~2 ~ 0.35 0 0.35 0.25 10

# If zeal is at zero and hasn't changed since last tick, no need to do anything of the below. Make sure we update the display and reset cooldowns
execute if score @s zeal.current matches 0 if score @s zeal.added matches 0 run scoreboard players set @s zeal.timeUntilReduce 0
execute if score @s zeal.current matches 0 if score @s zeal.added matches 0 run function questcraft:templar/zeal_meter_display with storage questcraft:args
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
execute if score @s zeal.timeUntilReduce matches 0 if score @s zeal.current matches 1.. run scoreboard players operation @s zeal.current -= _globals zeal.reductionSpeed
execute if score @s zeal.current matches ..0 run scoreboard players set @s zeal.current 0

# Heal the player as Zeal is reduced
execute if score @s zeal.isHealing matches 0 if score @s zeal.timeUntilReduce matches 0 if score @s zeal.current matches 1.. run effect give @s minecraft:regeneration infinite 4 true
execute if score @s zeal.isHealing matches 0 if score @s zeal.timeUntilReduce matches 0 if score @s zeal.current matches 1.. run scoreboard players set @s zeal.isHealing 1

# Stop heal the player if Zeal is not reducing
execute if score @s zeal.isHealing matches 1 if score @s zeal.timeUntilReduce matches 1.. run effect clear @s minecraft:regeneration
execute if score @s zeal.isHealing matches 1 if score @s zeal.timeUntilReduce matches 1.. run scoreboard players set @s zeal.isHealing 0
execute if score @s zeal.isHealing matches 1 if score @s zeal.current matches 0 run effect clear @s minecraft:regeneration
execute if score @s zeal.isHealing matches 1 if score @s zeal.current matches 0 run scoreboard players set @s zeal.isHealing 0

# Update display of the zeal bar
function questcraft:templar/zeal_meter_display with storage questcraft:args

scoreboard players reset _zeal_added_scaled var
scoreboard players reset _c_10 var

data remove storage questcraft:args playerId
data remove storage questcraft:args swordDamage
data remove storage questcraft:args swordUndeadDamage
data remove storage questcraft:args swordArthropodDamage
data remove storage questcraft:args swordFireTime
