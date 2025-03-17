# If the spell charge hasn't increased since last tick, It means the player stopped holding right click. Stop the charge up sound, then
# add this aspect to the spell. Do not add the aspect to the spell if the charge is past the max.
execute if score @s void_aspect.charge = @s void_aspect.maxCharge run stopsound @a player minecraft:block.bell.resonate
execute if score @s void_aspect.charge = @s void_aspect.maxCharge unless score @s void_aspect.charge > _globals spellCastingMaxCharge run function questcraft:spell_build_void

# Reset the charge and max to 0
execute if score @s void_aspect.charge = @s void_aspect.maxCharge run scoreboard players set @s void_aspect.charge 0
execute if score @s void_aspect.charge matches 0 run scoreboard players set @s void_aspect.maxCharge 0

# If the charge has increased since last tick (they are holding it down), update our tracking of the max to match
execute if score @s void_aspect.charge > @s void_aspect.maxCharge run scoreboard players operation @s void_aspect.maxCharge = @s void_aspect.charge

# If the charge reaches the max, trigger the spell casting process
# Get the mage id and cast details to pass to casting
execute if score @s void_aspect.charge = _globals spellCastingMaxCharge run execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
execute if score @s void_aspect.charge = _globals spellCastingMaxCharge run data modify storage questcraft:args castSource set value 3

# Attempt to cast. May or may not succeed based on spell details and cast source
execute if score @s void_aspect.charge = _globals spellCastingMaxCharge run function questcraft:spell_casting_prime with storage questcraft:args
