# Make the player a mage, and specifically not the other classes
scoreboard players set @s isMage 1
scoreboard players set @s isPathfinder 0
scoreboard players set @s isTemplar 0

# tag them as a mage for performance
tag @s add is_mage

# Give the mage their ID and up the next ID to use by 1
scoreboard players operation @s mageId = _globals nextMageId
scoreboard players add _globals nextMageId 1
# Get the mage ID into args to pass to other init methods
execute store result storage questcraft:args mageId int 1 run scoreboard players get @s mageId

# Mage-specific stats
scoreboard players set @s mageLevel 1
scoreboard players set @s spellBufferSize 4 
scoreboard players set @s soulPower.current 1000
scoreboard players set @s soulPower.max 1000
scoreboard players set @s isCastingPrimed 0
scoreboard players set @s bloodBondPower 0

# Set up the mage's Soul Meter
execute store result storage questcraft:args soulPowerMax int 1 run scoreboard players get @s soulPower.max
function questcraft:player/make_mage_soul_meter with storage questcraft:args

# Init variables used for spellcasting
scoreboard players operation @s spellCastingRequiredCastCharge = _globals spellCastingRequiredCastCharge
scoreboard players set @s vigor_aspect.charge 0
scoreboard players set @s vigor_aspect.maxCharge 0
scoreboard players set @s blood_aspect.charge 0
scoreboard players set @s blood_aspect.maxCharge 0
scoreboard players set @s soul_aspect.charge 0
scoreboard players set @s soul_aspect.maxCharge 0
scoreboard players set @s void_aspect.charge 0
scoreboard players set @s void_aspect.maxCharge 0

# Initialize the mage's information in mage_data storage
function questcraft:player/make_mage_storage with storage questcraft:args

data remove storage questcraft:args mageId
data remove storage questcraft:args soulPowerMax