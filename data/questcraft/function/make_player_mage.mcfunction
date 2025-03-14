# Make the player a mage
scoreboard players set @s isMage 1

# Give the mage their ID and up the next ID to use by 1
scoreboard players operation @s mageId = _globals nextMageId
scoreboard players add _globals nextMageId 1

# Mage-specific stats
scoreboard players set @s spellBufferSize 4 

# Init variables used for spellcasting
scoreboard players set @s vigor_aspect.charge 0
scoreboard players set @s vigor_aspect.maxCharge 0
scoreboard players set @s blood_aspect.charge 0
scoreboard players set @s blood_aspect.maxCharge 0
scoreboard players set @s soul_aspect.charge 0
scoreboard players set @s soul_aspect.maxCharge 0
scoreboard players set @s void_aspect.charge 0
scoreboard players set @s void_aspect.maxCharge 0

execute store result storage questcraft:args id int 1 run scoreboard players get @s mageId
function questcraft:make_player_mage_storage with storage questcraft:args
data remove storage questcraft:args id