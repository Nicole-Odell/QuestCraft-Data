# If the spell charge hasn't increased since last tick, It means the player stopped holding right click. Stop the charge up sound, then
# add this aspect to the spell. Do not add the aspect to the spell if the charge is past the max.
execute if score @s soul_aspect.charge = @s soul_aspect.maxCharge run stopsound @a player minecraft:entity.illusioner.prepare_blindness
execute unless score @s isCastingPrimed matches 1 if score @s soul_aspect.charge = @s soul_aspect.maxCharge unless score @s soul_aspect.charge > @s spellCastingRequiredCastCharge run function questcraft:spell_build_soul

# Handle the case where we are just confirming a primed raycasted spell
execute if score @s isCastingPrimed matches 1 if score @s soul_aspect.charge = @s soul_aspect.maxCharge unless score @s soul_aspect.charge > @s spellCastingRequiredCastCharge run data modify storage questcraft:args castSource set value 2
execute if score @s isCastingPrimed matches 1 if score @s soul_aspect.charge = @s soul_aspect.maxCharge unless score @s soul_aspect.charge > @s spellCastingRequiredCastCharge run function questcraft:spell_casting_cast_raycast_confirm

# Reset the charge and max to 0
execute if score @s soul_aspect.charge = @s soul_aspect.maxCharge run scoreboard players set @s soul_aspect.charge 0
execute if score @s soul_aspect.charge matches 0 run scoreboard players set @s soul_aspect.maxCharge 0

# If the charge has increased since last tick (they are holding it down), update our tracking of the max to match
execute if score @s soul_aspect.charge > @s soul_aspect.maxCharge run scoreboard players operation @s soul_aspect.maxCharge = @s soul_aspect.charge

# No need to do the below if this is for confirming a raycasted spell
execute if score @s isCastingPrimed matches 1 run return 1

# If the charge reaches the max, trigger the spell casting process
# Get the mage id and cast details to pass to casting
execute if score @s soul_aspect.charge = @s spellCastingRequiredCastCharge run execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId
execute if score @s soul_aspect.charge = @s spellCastingRequiredCastCharge run data modify storage questcraft:args castSource set value 2

# Attempt to cast. May or may not succeed based on spell details and cast source
execute if score @s soul_aspect.charge = @s spellCastingRequiredCastCharge run function questcraft:spell_casting_base with storage questcraft:args
