# Cancel if the cooldown hasn't reached 0, or if we don't have enough zeal for the ability
execute if score @s templar.abilityCooldown matches 1.. run return fail
execute unless score @s zeal.current >= _globals templar.crouchJumpAbilityCost run return fail

execute if score @s templar.crouchJumpAbility matches 0 run function questcraft:templar_ability_heavenly_strike
execute if score @s templar.crouchJumpAbility matches 1 run function questcraft:templar_ability_sacred_haven