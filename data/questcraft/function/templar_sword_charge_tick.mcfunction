# If the charge hasn't increased since last tick, It means the player stopped holding right click. Cast the ability, if possible.
# Do not trigger an ability if the charge is past the chargeToCast.
execute unless score @s templar.isAbilityPrimed matches 1 if score @s templar.swordCharge = @s templar.highestSwordCharge unless score @s templar.swordCharge > @s templar.swordChargeToCast run function questcraft:templar_ability_right_click

# Handle the case where we are just confirming a primed raycasted ability
execute if score @s templar.isAbilityPrimed matches 1 if score @s templar.swordCharge = @s templar.highestSwordCharge unless score @s templar.swordCharge > @s templar.swordChargeToCast run function questcraft:templar_ability_raycast_confirm

# Reset the charge and highest to 0
execute if score @s templar.swordCharge = @s templar.highestSwordCharge run scoreboard players set @s templar.swordCharge 0
execute if score @s templar.swordCharge matches 0 run scoreboard players set @s templar.highestSwordCharge 0

# If the charge has increased since last tick (they are holding it down), update our tracking of the highest to match
execute if score @s templar.swordCharge > @s templar.highestSwordCharge run scoreboard players operation @s templar.highestSwordCharge = @s templar.swordCharge

# No need to do the below if this is for confirming a raycasted ability
execute if score @s templar.isAbilityPrimed matches 1 run return 1

# If the charge reaches the chargeToCast, trigger the hold click ability
execute if score @s templar.swordCharge = @s templar.swordChargeToCast run function questcraft:templar_ability_right_click_hold