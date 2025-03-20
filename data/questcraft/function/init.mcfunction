# ==== General ==== #

gamerule snowAccumulationHeight 7

# scoreboard objectives add rayCastHops dummy
# scoreboard objectives add maxRayCastHops dummy
# scoreboard players set _globals maxRayCastHops 64

# Debug
scoreboard objectives add printDebug dummy
scoreboard players set _globals printDebug 0

scoreboard objectives add printTickTimes dummy
scoreboard players set _globals printTickTimes 0

scoreboard objectives add disableTick dummy
scoreboard players set _globals disableTick 0

# Temp storage used to pass function arguments (via macros)
data merge storage questcraft:args {}

# Force load the origin for projectile math
forceload add -1 -1 0 0

# Variables
scoreboard objectives add var dummy

# Projectile tracking
scoreboard objectives add nextProjectileId dummy
scoreboard players set _globals nextProjectileId 0
scoreboard objectives add projectileTtl dummy

# ==== Player ==== #

# Tracks what ID the next player will have. 
# Only need to set this once so don't do it if the player storage has already been set
scoreboard objectives add nextPlayerId dummy
execute unless data storage questcraft:player_data players run scoreboard players set _globals nextPlayerId 0

# Tracks the ID for each individual player
scoreboard objectives add playerId dummy

# Storage for data about players and their spellcasting state
execute unless data storage questcraft:player_data players run data merge storage questcraft:player_data {players:[]}

# Player-related constants
scoreboard objectives add temperature.max dummy
scoreboard players set _globals temperature.max 36000
scoreboard objectives add temperature.overheatingThreshold dummy
scoreboard players set _globals temperature.overheatingThreshold 30000
scoreboard objectives add temperature.hotThreshold dummy
scoreboard players set _globals temperature.hotThreshold 24000
scoreboard objectives add temperature.midpoint dummy
scoreboard players set _globals temperature.midpoint 18000
scoreboard objectives add temperature.coldThreshold dummy
scoreboard players set _globals temperature.coldThreshold 12000
scoreboard objectives add temperature.freezingThreshold dummy
scoreboard players set _globals temperature.freezingThreshold 6000

scoreboard objectives add wetness.max dummy
scoreboard players set _globals wetness.max 12000
scoreboard objectives add wetness.wetThreshold dummy
scoreboard players set _globals wetness.wetThreshold 6000
scoreboard objectives add wetness.waterWetSpeed dummy
scoreboard players set _globals wetness.waterWetSpeed 200
scoreboard objectives add wetness.rainWetSpeed dummy
scoreboard players set _globals wetness.rainWetSpeed 5
scoreboard objectives add wetness.drySpeed dummy
scoreboard players set _globals wetness.drySpeed 1

scoreboard objectives add hydration.max dummy
scoreboard players set _globals hydration.max 30000
scoreboard objectives add hydration.lossSpeed dummy
scoreboard players set _globals hydration.lossSpeed 1
scoreboard objectives add hydration.drinkAmount dummy
scoreboard players set _globals hydration.drinkAmount 18000

# Speed that temperature changes
scoreboard objectives add temperature.changeSpeed dummy
scoreboard players set _globals temperature.changeSpeed 5

# Player stats
scoreboard objectives add temperature.current dummy
scoreboard objectives add temperature.environmentCurrent dummy
scoreboard objectives add temperature.wasEvaluatedThisTick dummy
scoreboard objectives add food food
scoreboard objectives add health health
scoreboard objectives add wetness.current dummy
scoreboard objectives add hydration.current dummy
scoreboard objectives add isNearWarmth dummy

# ==== Mage ==== #

# Tracks whether a player is a mage
scoreboard objectives add isMage dummy

# Tracks what ID the next mage will have. 
# Only need to set this once so don't do it if the mage storage has already been set
scoreboard objectives add nextMageId dummy
execute unless data storage questcraft:mage_data mages run scoreboard players set _globals nextMageId 0

# Tracks the ID for each individual mage
scoreboard objectives add mageId dummy

# Storage for data about mages and their spellcasting state
execute unless data storage questcraft:mage_data mages run data merge storage questcraft:mage_data {mages:[]}

# Mage-specific stats
scoreboard objectives add mageLevel dummy
scoreboard objectives add spellBufferSize dummy
scoreboard objectives add soulPower.current dummy
scoreboard objectives add soulPower.max dummy

# Spellcasting constants
scoreboard objectives add spellCastingMaxCharge dummy
scoreboard players set _globals spellCastingMaxCharge 20

scoreboard objectives add spellCastingFoodPower dummy
scoreboard players set _globals spellCastingFoodPower 1

scoreboard objectives add spellCastingBloodPower dummy
scoreboard players set _globals spellCastingBloodPower 2

scoreboard objectives add spellCastingSoulPower dummy
scoreboard players set _globals spellCastingSoulPower 2

# Variables for spellcasting
scoreboard objectives add vigor_aspect.charge dummy
scoreboard objectives add vigor_aspect.maxCharge dummy
scoreboard objectives add blood_aspect.charge dummy
scoreboard objectives add blood_aspect.maxCharge dummy
scoreboard objectives add soul_aspect.charge dummy
scoreboard objectives add soul_aspect.maxCharge dummy
scoreboard objectives add void_aspect.charge dummy
scoreboard objectives add void_aspect.maxCharge dummy

# ==== Pathfinder ==== #

# Tracks whether a player is a Pathfinder
scoreboard objectives add isPathfinder dummy

# ==== Templar ==== #

# Tracks whether a player is a Templar
scoreboard objectives add isTemplar dummy