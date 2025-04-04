# If the player jumped and crouch was charged, execute the crouch jump ability and reset the charge state
execute if score @s newJumps matches 1.. if score @s templar.isCrouchAbilityReady matches 1 run function questcraft:templar_ability_crouch_jump
execute if score @s newJumps matches 1.. if score @s templar.isCrouchAbilityReady matches 1 run scoreboard players set @s templar.isCrouchAbilityReady 0

# If the charge hasn't increased since last tick, It means the player stopped holding crouch. Remove the crouch charged state
execute if score @s templar.crouchCharge = @s templar.highestCrouchCharge run scoreboard players set @s templar.isCrouchAbilityReady 0

# if we have enough zeal to cast any crouch charge ability and we have reached a certain point, start playing the charge up sound and delay loss of zeal until at least charge is complete
execute if score @s zeal.current >= _globals templar.crouchJumpAbilityCost if score @s templar.crouchCharge matches 5 run playsound block.portal.trigger player @s ~ ~1 ~ 0.5 2 0.5
execute if score @s zeal.current >= _globals templar.crouchJumpAbilityCost if score @s templar.crouchCharge matches 5.. if score @s templar.crouchCharge <= _globals templar.crouchChargeToCast run scoreboard players operation @s zeal.timeUntilReduce = _globals zeal.timeUntilReduce

# Reset the charge and highest to 0 if it hasn't increased since last tick
execute if score @s templar.crouchCharge = @s templar.highestCrouchCharge run scoreboard players set @s templar.crouchCharge 0
execute if score @s templar.crouchCharge matches 0 run scoreboard players set @s templar.highestCrouchCharge 0
# Stop the charge up sound
execute if score @s templar.crouchCharge matches 0 run stopsound @s player block.portal.trigger

# If the charge has increased since last tick (they are holding it down), update our tracking of the highest to match
execute if score @s templar.crouchCharge > @s templar.highestCrouchCharge run scoreboard players operation @s templar.highestCrouchCharge = @s templar.crouchCharge

# If the charge reaches the chargeToCast, track that they are ready to cast a crouch ability and playe the sound
execute if score @s templar.crouchCharge = _globals templar.crouchChargeToCast run scoreboard players set @s templar.isCrouchAbilityReady 1
execute if score @s templar.crouchCharge = _globals templar.crouchChargeToCast run playsound block.bell.use player @s ~ ~1 ~ 1 0 1

# If they don't have enough zeal to cast a crouch ability, cancel the charged state. They will have to uncrouch and crouch again to start charging again.
execute if score @s templar.isCrouchAbilityReady matches 1 if score @s zeal.current < _globals templar.crouchJumpAbilityCost run scoreboard players set @s templar.isCrouchAbilityReady 0

# Played charged effects
execute if score @s templar.isCrouchAbilityReady matches 1 run playsound block.amethyst_block.chime player @s ~ ~1 ~ 1 1 1
execute if score @s templar.isCrouchAbilityReady matches 1 run particle electric_spark ~ ~0.1 ~ 0.75 0.05 0.75 0.5 40 force

# Stop sounds if the charge was cancelled by holding it too long until zeal decreased
execute if score @s templar.isCrouchAbilityReady matches 0 run stopsound @s player block.amethyst_block.chime