# Clear the mage's spell buffer
$data modify storage questcraft:mage_data mages[$(mageId)].spell set value []

# Clear the mage's raycasting state
scoreboard players set @s isCastingPrimed 0
$data remove storage questcraft:mage_data mages[$(mageId)].spellDetails

# Reset Cooling Aura state
tag @s remove cooling_aura
scoreboard players set @s coolingAuraTime 0

# Remove any active blood bonds for this mage and reset their own blood bonded state
$execute as @e[type=#questcraft:is_attack_targetable,tag=blood_bonded_$(mageId)] run function questcraft:spell_bloodbond_remove with storage questcraft:args
scoreboard players set @s bloodBondPower 0

# Reset Ward state
tag @s remove ward_active
scoreboard players set @s wardTime 0

# Cancel Bumble Dry
tag @s remove bumble_dry
scoreboard players set @s bumbleDryTime 0

# Reset levitation state to prevent the scheduled function from applying slow falling
tag @s remove spell_levitating

# Reset spellCastingRequiredCastCharge to default, and reset casting state
scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge
scoreboard players set @s vigor_aspect.charge 0
scoreboard players set @s vigor_aspect.maxCharge 0
scoreboard players set @s blood_aspect.charge 0
scoreboard players set @s blood_aspect.maxCharge 0
scoreboard players set @s soul_aspect.charge 0
scoreboard players set @s soul_aspect.maxCharge 0
scoreboard players set @s void_aspect.charge 0
scoreboard players set @s void_aspect.maxCharge 0

# Note that we do NOT reset soul power since we want sleeping to be the only way to do that