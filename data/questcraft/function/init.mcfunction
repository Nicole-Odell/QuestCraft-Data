# ==== Technical ==== #

# Force load the origin for projectile math
forceload add -1 -1 0 0

# Raycast Settings
scoreboard objectives add raycast.maxRange dummy
scoreboard players set _globals raycast.maxRange 64

# Debug
scoreboard objectives add printDebug dummy
scoreboard players set _globals printDebug 0

scoreboard objectives add printTickTimes dummy
scoreboard players set _globals printTickTimes 0

scoreboard objectives add disableTick dummy
scoreboard players set _globals disableTick 0

# Particles Gallery
scoreboard objectives add particlesGallerySpeed dummy
scoreboard objectives add particlesGalleryCount dummy
scoreboard objectives add particlesGalleryDeltaX dummy
scoreboard objectives add particlesGalleryDeltaY dummy
scoreboard objectives add particlesGalleryDeltaZ dummy
scoreboard objectives add particlesGalleryColorR dummy
scoreboard objectives add particlesGalleryColorG dummy
scoreboard objectives add particlesGalleryColorB dummy
scoreboard objectives add particlesGalleryForce dummy
scoreboard objectives add particlesGallerySelectedEffect dummy
scoreboard objectives add particlesGalleryOnlySelected dummy

# Temp storage used to pass function arguments (via macros)
data merge storage questcraft:args {}

# Used for all temporary variables
scoreboard objectives add var dummy

# ==== General ==== #

# Gamerules and state
gamerule snowAccumulationHeight 7

# Projectile tracking
scoreboard objectives add nextProjectileId dummy
scoreboard players set _globals nextProjectileId 0
scoreboard objectives add projectileTtl dummy
scoreboard objectives add projectileTimeAlive dummy
scoreboard objectives add projectileHasImpacted dummy

# Teams used for coloring entities
team add Black
team modify Black color black
team add Dark_Blue "Dark Blue"
team modify Dark_Blue color dark_blue
team add Dark_Green "Dark Green"
team modify Dark_Green color dark_green
team add Dark_Aqua "Dark Aqua"
team modify Dark_Aqua color dark_aqua
team add Dark_Red "Dark Red"
team modify Dark_Red color dark_red
team add Dark_Purple "Dark Purple"
team modify Dark_Purple color dark_purple
team add Gold
team modify Gold color gold
team add Gray
team modify Gray color gray
team add Dark_Gray "Dark Gray"
team modify Dark_Gray color dark_gray
team add Blue
team modify Blue color blue
team add Green
team modify Green color green
team add Aqua
team modify Aqua color aqua
team add Red
team modify Red color red
team add Light_Purple "Light Purple"
team modify Light_Purple color light_purple
team add Yellow
team modify Yellow color yellow
team add White
team modify White color white

# Set up the lists of names used for POIs
execute unless data storage questcraft:poi_data poiTypes run function questcraft:poi/init_names


# ==== Players ==== #

# Tracks what ID the next player will have. 
# Only need to set this once so don't do it if the player storage has already been set
scoreboard objectives add nextPlayerId dummy
execute unless data storage questcraft:player_data players run scoreboard players set _globals nextPlayerId 0

# Tracks the ID for each individual player
scoreboard objectives add playerId dummy

# Storage for data about players
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
scoreboard players set _globals wetness.wetThreshold 4000
scoreboard objectives add wetness.drenchedThreshold dummy
scoreboard players set _globals wetness.drenchedThreshold 8000
scoreboard objectives add wetness.waterWetSpeed dummy
scoreboard players set _globals wetness.waterWetSpeed 200
scoreboard objectives add wetness.rainWetSpeed dummy
scoreboard players set _globals wetness.rainWetSpeed 5
scoreboard objectives add wetness.drySpeed dummy
scoreboard players set _globals wetness.drySpeed 1
# Pre-calculate this to save time later
scoreboard objectives add wetness.drenchedThresholdMinusRainWetSpeed dummy
scoreboard players operation _globals wetness.drenchedThresholdMinusRainWetSpeed = _globals wetness.drenchedThreshold
scoreboard players operation _globals wetness.drenchedThresholdMinusRainWetSpeed -= _globals wetness.rainWetSpeed

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
scoreboard objectives add temperature.currentLevel dummy
scoreboard objectives add temperature.environmentCurrent dummy
scoreboard objectives add temperature.wasEvaluatedThisTick dummy
scoreboard objectives add wetness.current dummy
scoreboard objectives add hydration.current dummy
scoreboard objectives add isNearWarmth dummy
scoreboard objectives add food food
scoreboard objectives add health health
scoreboard objectives add timeSinceLastRest minecraft.custom:minecraft.time_since_rest
scoreboard objectives add newJumps minecraft.custom:minecraft.jump

# Status effect related stats
scoreboard objectives add frozenTime dummy

# POI status
scoreboard objectives add currentPoiType dummy

# Tracks whether there is a critical actionbar title that shouldn't be overwritten,
# and how much longer that is the case
scoreboard objectives add actionbarNoOverrideTime dummy


# ==== Mages ==== #

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
scoreboard objectives add bloodBondPower dummy
scoreboard objectives add spellCastingRequiredCastCharge dummy
scoreboard objectives add isCastingPrimed dummy

# Spell effects
scoreboard objectives add coolingAuraTime dummy
scoreboard objectives add wardTime dummy
scoreboard objectives add bloodBond.timeRemaining dummy
scoreboard objectives add bloodBond.bondedMageId dummy
scoreboard objectives add bloodBond.castedToThisTick dummy
scoreboard objectives add impactShotsInBurst dummy
scoreboard objectives add bumbleDryTime dummy

# Spellcasting constants
scoreboard players set _globals spellCastingRequiredCastCharge 12

scoreboard objectives add spellCastingFoodPower dummy
scoreboard players set _globals spellCastingFoodPower 1

scoreboard objectives add spellCastingBloodPower dummy
scoreboard players set _globals spellCastingBloodPower 1
# Power from blood bond is divided by this amount
scoreboard objectives add spellCastingBloodBondPowerDivider dummy
scoreboard players set _globals spellCastingBloodBondPowerDivider 1

scoreboard objectives add spellCastingSoulPower dummy
scoreboard players set _globals spellCastingSoulPower 1

# Variables for spellcasting
scoreboard objectives add vigor_aspect.charge dummy
scoreboard objectives add vigor_aspect.maxCharge dummy
scoreboard objectives add blood_aspect.charge dummy
scoreboard objectives add blood_aspect.maxCharge dummy
scoreboard objectives add soul_aspect.charge dummy
scoreboard objectives add soul_aspect.maxCharge dummy
scoreboard objectives add void_aspect.charge dummy
scoreboard objectives add void_aspect.maxCharge dummy


# ==== Pathfinders ==== #

# Tracks whether a player is a Pathfinder
scoreboard objectives add isPathfinder dummy


# ==== Templars ==== #

# Tracks whether a player is a Templar
scoreboard objectives add isTemplar dummy

# Score used for Zeal tracking and management
scoreboard objectives add zeal.current dummy
scoreboard objectives add zeal.currentLevel dummy
scoreboard objectives add zeal.max dummy
scoreboard objectives add zeal.added minecraft.custom:minecraft.damage_dealt
scoreboard objectives add zeal.timeUntilReduce dummy
scoreboard objectives add zeal.reductionSpeed dummy
scoreboard objectives add zeal.isHealing dummy

# Tracks which abilities templars have equipped
scoreboard objectives add templar.altClickAbility dummy
scoreboard objectives add templar.holdClickAbility dummy
scoreboard objectives add templar.crouchJumpAbility dummy
scoreboard objectives add templar.crouchClickAbility dummy

# Variables for ability casting
scoreboard objectives add templar.swordCharge dummy
scoreboard objectives add templar.highestSwordCharge dummy
scoreboard objectives add templar.swordChargeToCast dummy
scoreboard objectives add templar.isSwordAbilityReady dummy

scoreboard objectives add templar.crouchCharge dummy
scoreboard objectives add templar.highestCrouchCharge dummy
scoreboard objectives add templar.crouchChargeToCast dummy
scoreboard objectives add templar.isCrouchAbilityReady dummy

scoreboard objectives add templar.abilityCooldown dummy

scoreboard objectives add templar.altClickAbilityCost dummy
scoreboard objectives add templar.holdClickAbilityCost dummy
scoreboard objectives add templar.crouchJumpAbilityCost dummy
scoreboard objectives add templar.crouchClickAbilityCost dummy

# Tracks whether a raycasted ability is awaiting a right click to confirm
scoreboard objectives add templar.isAbilityPrimed dummy

# Damage the Templar's sword does + effects
scoreboard objectives add templar.swordDamage dummy
scoreboard objectives add templar.swordUndeadDamage dummy
scoreboard objectives add templar.swordArthropodDamage dummy
scoreboard objectives add templar.swordFireTime dummy

# Constants for Templars
# The max zeal for Templars
scoreboard players set _globals zeal.max 150
# The time from when zeal was last added until it starts to reduce
scoreboard players set _globals zeal.timeUntilReduce 100
# Default rate for how fast zeal reduces once it starts to
scoreboard players set _globals zeal.reductionSpeed 1
# How long you have to hold right click or crouch to trigger an ability
scoreboard players set _globals templar.swordChargeToCast 15
scoreboard players set _globals templar.crouchChargeToCast 45
# Cooldown between using abilities
scoreboard players set _globals templar.abilityCooldown 10
# Cost for each ability
scoreboard players set _globals templar.altClickAbilityCost 5
scoreboard players set _globals templar.holdClickAbilityCost 20
scoreboard players set _globals templar.crouchJumpAbilityCost 75
scoreboard players set _globals templar.crouchClickAbilityCost 150

# Status effects
scoreboard objectives add zealousChargeTime dummy
scoreboard objectives add heavenlyStrikeFloatTime dummy

# Time that players float while waiting to confirm the Heavenly Strike ability
scoreboard players set _globals heavenlyStrikeFloatTime 100