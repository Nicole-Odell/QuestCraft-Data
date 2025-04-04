# Make the player a templar, and specifically not the other classes
scoreboard players set @s isMage 0
scoreboard players set @s isPathfinder 0
scoreboard players set @s isTemplar 1

# tag them as a templar for performance
tag @s add is_templar

# Get the player's ID into args to pass to other init methods
execute store result storage questcraft:args playerId int 1 run scoreboard players get @s playerId

# Templar-specific stats
scoreboard players set @s zeal.current 0
scoreboard players set @s zeal.currentLevel 0
# Default is only enough for basic, advanced, and expert level abilities.
# Master cannot be used until they reach the max at a later level
scoreboard players set @s zeal.max 75
scoreboard players set @s zeal.added 0
scoreboard players set @s zeal.timeUntilReduce 0
scoreboard players operation @s zeal.reductionSpeed = _globals zeal.reductionSpeed
scoreboard players set @s zeal.isHealing 0

# Selected abilities
scoreboard players set @s templar.altClickAbility 0
scoreboard players set @s templar.holdClickAbility 0
scoreboard players set @s templar.crouchJumpAbility 0
scoreboard players set @s templar.crouchClickAbility 0

# Variables for ability casting
scoreboard players set @s templar.swordCharge 0
scoreboard players set @s templar.highestSwordCharge 0
scoreboard players operation @s templar.swordChargeToCast = _globals templar.swordChargeToCast
scoreboard players set @s templar.crouchCharge 0
scoreboard players set @s templar.highestCrouchCharge 0
scoreboard players operation @s templar.crouchChargeToCast = _globals templar.crouchChargeToCast
scoreboard players operation @s templar.abilityCooldown = _globals templar.abilityCooldown
# Tracks whether a raycasted ability is awaiting a right click to confirm
scoreboard players set @s templar.isAbilityPrimed 0

# Set up the templar's Zeal Meter
execute store result storage questcraft:args zealMax int 1 run scoreboard players get @s zeal.max
function questcraft:make_player_templar_zeal_meter with storage questcraft:args


data remove storage questcraft:args playerId
data remove storage questcraft:args zealMax